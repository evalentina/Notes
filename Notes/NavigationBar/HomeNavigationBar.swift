//
//  HomeNavigationBar.swift
//  Notes
//
//  Created by Валентина Евдокимова on 30.08.2022.
//

import Foundation
import UIKit

class HomeNavigationBar {
    
    weak var homeViewController : UIViewController?
    
    init(homeViewController: UIViewController) {
        self.homeViewController = homeViewController
    }

    deinit {
      print("\(self) deinited")
    }
    
    open func buildNavigationBarItems() {
        let moreItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(alertConfiguration))
        moreItem.tintColor = UIColor.systemYellow
        
        let rightBarItem: [UIBarButtonItem] = [moreItem]
        homeViewController?.navigationItem.rightBarButtonItems = rightBarItem
    }
    
    @objc private func alertConfiguration() {
        let alert = UIAlertController(title: "Notes", message: nil, preferredStyle: .actionSheet)
        let viewAsGallery = UIAlertAction(title: "View as gallery", style: .default)
        let selectNotes = UIAlertAction(title: "Select notes", style: .default)
        
        alert.addAction(viewAsGallery)
        alert.addAction(selectNotes)
        homeViewController?.present(alert, animated: true)
    }
}


