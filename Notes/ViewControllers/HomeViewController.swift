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
    
    var homeNavigationBar: HomeNavigationBar?
    var editIndexPath: IndexPath?
    var insertIndexPath: IndexPath?
    var isFiltering: Bool = false
    var didSetupSections: Bool = false
    var tableSectionsAmount: Int = 1

    var notes = Notes()
    lazy var filteredNotes: [Note] = (notes.copy(with: nil) as? Notes)?.notes ?? [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notes"
        tableViewNotes.dataSource = self
        tableViewNotes.delegate = self
        searchNote.delegate = self
        configureNavigationBar()
        configureGestures()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !didSetupSections {
            setupInitialSections()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let editIndexPath = editIndexPath {
            tableViewNotes.reloadRows(at: [editIndexPath], with: .automatic)
            self.editIndexPath = nil
        }
        if let insertIndexPath = insertIndexPath {
            tableViewNotes.insertRows(at: [insertIndexPath], with: .automatic)
            self.insertIndexPath = nil
        }
    }
    
    deinit {
        // HomeViewController deinited
    }
    
    private func configureNavigationBar() {
        homeNavigationBar = HomeNavigationBar(homeViewController: self)
        homeNavigationBar?.configurationNavigationBarItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case HomeConstants.goToNewNoteVCSegueId:
            let newNoteVC = segue.destination as? NewNoteViewController
            newNoteVC?.notes = notes
            newNoteVC?.notesDelegate = self
        case HomeConstants.goToEditNoteSegueId:
            let cellSender = sender as? NoteTableViewCell
            let newNoteVC = segue.destination as? NewNoteViewController
            guard let indexPath = tableViewNotes.indexPathForSelectedRow else { return }
            newNoteVC?.notes = notes
            newNoteVC?.note = cellSender?.note
            newNoteVC?.notesDelegate = self
            newNoteVC?.noteSceneType = .isEditingNote
            newNoteVC?.noteIndexPath = indexPath
        default:
            return
            
        }
    }
}

extension HomeViewController: NotesDelegate {
    
    func didSaveNote(note: Note) {
      notes.insertNewNote(&filteredNotes, isFiltering, note: note)
      let section: Int = tableSectionsAmount > 1 ? 1 : 0
      insertIndexPath = IndexPath(row: 0, section: section)
    }
    
    func didEditNote(noteIndexPath: IndexPath, title: String, content: String) {
      let globalIndex: Int = getIndexForSection(in: noteIndexPath)
      notes.updateNote(&filteredNotes, isFiltering, noteIndex: globalIndex, title: title, content: content)
      editIndexPath = noteIndexPath
    }
}
