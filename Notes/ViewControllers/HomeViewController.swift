//
//  ViewController.swift
//  Notes
//
//  Created by Валентина Евдокимова on 28.08.2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeNavigationBar : HomeNavigationBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
        
    }
    
    private func configurationNavigationBar() {
      homeNavigationBar = HomeNavigationBar(homeViewController: self)
      homeNavigationBar?.buildNavigationBarItems()
    }


}

