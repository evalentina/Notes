//
//  NoteDelegate.swift
//  Notes
//
//  Created by Валентина Евдокимова on 02.09.2022.
//

import Foundation

protocol NotesDelegate: AnyObject {
    
    func didSaveNote(note: Note)
    func didEditNote(noteIndexPath: IndexPath, title: String, content: String)
    
}
