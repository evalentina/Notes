//
//  ViewController.swift
//  Notes
//
//  Created by Валентина Евдокимова on 28.08.2022.
//

import UIKit

class HomeViewController: UIViewController {
        
    @IBOutlet weak var searchNote: UISearchBar!
    @IBOutlet weak var tableViewNotes: UITableView!
    
    var homeNavigationBar : HomeNavigationBar?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        configurationNavigationBar()
        
    }
    
    private func configurationNavigationBar() {
        homeNavigationBar = HomeNavigationBar(homeViewController: self)
        homeNavigationBar?.configurationNavigationBarItems()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Notes", style: .plain, target: nil, action: nil)
        
    }
}

