//
//  NewNoteNavigation.swift
//  Notes
//
//  Created by Валентина Евдокимова on 30.08.2022.
//

import Foundation
import UIKit

class NewNoteNavigationBar {
    
    weak var newNoteVC : UIViewController?
    
    init(newNoteVC: UIViewController) {
      self.newNoteVC = newNoteVC
    }
    
    deinit { print("NewNavigationBar deinited") }
        
    func configurationNavigationItems() {
        let doneItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneItemAction))
        let shareItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(shareItemAction))
        doneItem.tintColor = .systemYellow
        shareItem.tintColor = .systemYellow
        let rightBarItems = [doneItem, shareItem]
        newNoteVC?.navigationItem.rightBarButtonItems = rightBarItems
        
    }
    @objc func doneItemAction() {
        print("Save")
        //newNoteVC?.willSaveNewNote()
    }
    @objc func shareItemAction() {
        
    }
}
