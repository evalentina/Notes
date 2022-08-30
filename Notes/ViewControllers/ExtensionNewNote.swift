//
//  Extension New Note.swift
//  Notes
//
//  Created by Валентина Евдокимова on 29.08.2022.
//

import Foundation
import UIKit

extension NewNoteViewController {
    
    func willSaveNewNote() {
        guard var title = noteTitleField.text?.trimmingCharacters(in: .whitespaces) else { return }
        guard var content = noteTextView.text?.trimmingCharacters(in: .whitespaces) else { return }
        
        if title.isEmpty {
            title = "Unnamed"
        }
        if content.isEmpty {
            content = "No content"
        }
        navigationController?.popViewController(animated: true)
    }
    
    func didClearNewNote() {
        noteTitleField.text? = ""
        noteTextView.text? = ""
        
    }
}




