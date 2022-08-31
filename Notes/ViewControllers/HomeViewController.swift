//
//  ViewController.swift
//  Notes
//
//  Created by Валентина Евдокимова on 28.08.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeNavigationBar : HomeNavigationBar {
        return HomeNavigationBar(homeViewController: self, alertSheets: AlertSheets())
    }

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        homeNavigationBar.buildNavigationBarItems()
        homeNavigationBar.alertSheets?.alertConfiguration()
        
    }


}

