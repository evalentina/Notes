//
//  Protocols.swift
//  Notes
//
//  Created by Валентина Евдокимова on 30.08.2022.
//

import Foundation

protocol NewNoteDelegate: AnyObject {
  func willSaveNewNote()
  func didClearNewNote()
  func didShareNote()
}

