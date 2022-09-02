//
//  NewNoteNavigation.swift
//  Notes
//
//  Created by Валентина Евдокимова on 30.08.2022.
//

import Foundation
import UIKit

class NewNoteNavigationBar {
    
    weak var newNoteViewController: UIViewController?
    weak var newNoteDelegate: NewNoteDelegate?
    
    init(newNoteViewController: UIViewController) {
        self.newNoteViewController = newNoteViewController
    }
    
    deinit { print("NewNavigationBar deinited") }
        
    func configurationNavigationItems() {
        let doneItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneItemAction))
        doneItem.tintColor = .systemYellow
        let rightBarItem: [UIBarButtonItem] = [doneItem]
        newNoteViewController?.navigationItem.rightBarButtonItems = rightBarItem
        newNoteViewController?.navigationItem.rightBarButtonItem?.tintColor = .systemYellow
        
    }
    @objc func doneItemAction() {
        newNoteDelegate?.willSaveNewNote()
        newNoteViewController?.navigationController?.popViewController(animated: true)
    }
}
