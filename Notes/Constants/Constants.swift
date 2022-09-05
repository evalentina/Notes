//
//  Constants.swift
//  Notes
//
//  Created by Валентина Евдокимова on 01.09.2022.
//

import Foundation

public let key = "Key"
public let noteCell = "NoteCell"

enum NoteSceneType {
  case isCreatingNewNote
  case isEditingNote
}

enum HomeConstants {
  static let goToNewNoteVCSegueId: String = "goToNewNoteVC"
  static let goToEditNoteSegueId: String = "goToEditNoteVC"
}
