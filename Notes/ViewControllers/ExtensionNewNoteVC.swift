//
//  Extension New Note.swift
//  Notes
//
//  Created by Валентина Евдокимова on 29.08.2022.
//

import Foundation
import UIKit

extension NewNoteViewController: NewNoteDelegate {
    
    func willSaveNewNote() {
        
        guard var title = noteTitleField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard var content = noteTextView.text?.trimmingCharacters(in: .whitespaces) else { return }

        if title == "" {
          title = "Unnamed"
        }

        if content == "" {
            content = "No content"
        }
        
        switch noteSceneType {
          case .isCreatingNewNote:
            createNewNote(title: title, content: content)
          case .isEditingNote:
            editNote(title: title, content: content)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func didClearNewNote() {
        
        noteTitleField.text? = ""
        noteTextView.text? = ""
    }
    
    private func createNewNote(title: String, content: String) {
        
        let note = Note(title: title, content: content)
        notesDelegate?.didSaveNote(note: note)
    }
    
    private func editNote(title: String, content: String) {
        
        notesDelegate?.didEditNote(noteIndexPath: noteIndexPath, title: title, content: content)
    }
}






