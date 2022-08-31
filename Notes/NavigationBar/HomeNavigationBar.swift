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
    
    let alertSheets : AlertSheets?
    
    init(homeViewController: UIViewController, alertSheets: AlertSheets) {
        self.homeViewController = homeViewController
        self.alertSheets = alertSheets
    }

    deinit {
      print("\(self) deinited")
    }
    
    func buildNavigationBarItems() {
        let moreItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(alertSheets?.alertConfiguration))
        moreItem.tintColor = UIColor.systemYellow
        
        let rightBarItem: [UIBarButtonItem] = [moreItem]
        homeViewController?.navigationItem.rightBarButtonItems = rightBarItem
    }
}


