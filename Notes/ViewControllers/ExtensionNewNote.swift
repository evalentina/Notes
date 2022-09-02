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
        print("Save")
      
    }    
    func didClearNewNote() {
        noteTitleField.text? = ""
        noteTextView.text? = ""
        
    }
}





