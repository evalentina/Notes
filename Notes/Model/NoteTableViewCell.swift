//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Валентина Евдокимова on 29.08.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var noteContent: UILabel!
    @IBOutlet weak var noteDate: UILabel!
    
    
    var note: Note? {
        didSet {
            configureNoteTitle(title: note?.title)
            configureNoteContent(content: note?.content)
        }
    }
    
    private func configureNoteTitle(title: String?) {
        
      guard let title = title else { return }
      noteTitle.text = title
    }
    
    private func configureNoteContent(content: String?) {
      guard let content = content?.trimmingCharacters(in: .whitespaces) else { return }
      noteContent.text = content
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
    }
    
}
