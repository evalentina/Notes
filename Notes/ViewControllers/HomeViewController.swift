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
    let notes = Notes()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notes"
        tableViewNotes.delegate = self
        tableViewNotes.dataSource = self
        configurationNavigationBar()
        
    }
    
    private func configurationNavigationBar() {
        homeNavigationBar = HomeNavigationBar(homeViewController: self)
        homeNavigationBar?.configurationNavigationBarItems()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Notes", style: .plain, target: nil, action: nil)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as! NoteTableViewCell
        return cell
    }
    
    
}

