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
        guard var body = noteTextView.text?.trimmingCharacters(in: .whitespaces) else { return }

        if title == "" {
          title = "Unnamed"
        }

        if body == "" {
          body = "No content"
        }
      
    }
    
    func didClearNewNote() {
        noteTitleField.text? = ""
        noteTextView.text? = ""
        
    }
}





