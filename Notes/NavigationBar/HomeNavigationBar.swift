//
//  HomeNavigationBar.swift
//  Notes
//
//  Created by Валентина Евдокимова on 30.08.2022.
//

import Foundation
import UIKit

class HomeNavigationBar {
    
    var homeViewController = HomeViewController()
    
    func buildNavigationBarItems() {
        let moreItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: #selector(showMoreOptions))
        moreItem.tintColor = UIColor.systemYellow
        
        let rightBarItem: [UIBarButtonItem] = [moreItem]
        homeViewController.navigationItem.rightBarButtonItems = rightBarItem
    }
    
    @objc func showMoreOptions() {
        let homeAlertActionSheetVC = UIStoryboard(name: "HomeActionSheet", bundle: .main).instantiateViewController(withIdentifier: "HomeAlertActionSheetVC") as! HomeActionSheetVC
        homeViewController.present(homeAlertActionSheetVC, animated: true, completion: nil)
    }
}


