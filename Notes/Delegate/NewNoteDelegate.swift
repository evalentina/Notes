//
//  NewNoteDelegate.swift
//  Notes
//
//  Created by Валентина Евдокимова on 01.09.2022.
//

import Foundation

protocol NewNoteDelegate: AnyObject {    
    func willSaveNewNote()
    func didClearNewNote()
}
