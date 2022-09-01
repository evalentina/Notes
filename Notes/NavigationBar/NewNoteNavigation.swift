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
    let defaults = UserDefaults.standard
    
    init(newNoteVC: UIViewController) {
      self.newNoteVC = newNoteVC
    }
    
    deinit { print("NewNavigationBar deinited") }
        
    func configurationNavigationItems() {
        let doneItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneItemAction))
        doneItem.tintColor = .systemYellow
        let rightBarItem = [doneItem]
        newNoteVC?.navigationItem.rightBarButtonItems = rightBarItem
        
    }
    @objc func doneItemAction() {
        //newNoteVC.willSaveNewNote()
    }
}
