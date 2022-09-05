//
//  ExtensionHome.swift
//  Notes
//
//  Created by Валентина Евдокимова on 02.09.2022.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    
    internal func getIndexForSection(in indexPath: IndexPath) -> Int {
      var sumRowsBySection: Int = 0
      for section in 0 ..< indexPath.section {
        sumRowsBySection += tableViewNotes.numberOfRows(inSection: section)
      }
      return sumRowsBySection + indexPath.row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: noteCell, for: indexPath) as! NoteTableViewCell
        let globalIndex: Int = getIndexForSection(in: indexPath)
        let note = filteredNotes[globalIndex]
        cell.note = note
        return cell
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
      return tableSectionsAmount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      guard tableView.numberOfSections > 1 else { return filteredNotes.count }

      var rowsInSection: Int {
        // pinned section
        if tableView.numberOfSections == 2, section == 0 {
          return notes.pinnedNotes.count
        }
        // not pinned
        return notes.notPinnedNotes.count
      }

      return rowsInSection
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      guard tableView.numberOfSections == 2 else {
        return ""
      }
      return section == 0 ? "Pinned" : "Notes"
    }

    
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let globalIndex: Int = self.getIndexForSection(in: indexPath)
            self.notes.deleteNote(&self.filteredNotes, self.isFiltering, noteIndex: globalIndex)
            self.tableViewNotes.deleteRows(at: [indexPath], with: .left)
            if self.tableViewNotes.numberOfSections == 2, self.notes.pinnedNotes.count == 0 {
              self.tableSectionsAmount = 1
                self.tableViewNotes.deleteSections(IndexSet(arrayLiteral: 0), with: .left)
            }
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.image?.withTintColor(UIColor.yellow)
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        swipeConfiguration.performsFirstActionWithFullSwipe = true
        return swipeConfiguration
        
    }


  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    searchNote.resignFirstResponder()
  }
    
    func setupInitialSections() {
      if tableViewNotes.numberOfSections == 1, notes.pinnedNotes.count > 0, !didSetupSections {

        tableSectionsAmount = 2
        didSetupSections = true
      }
    }
}


