//
//  NewNoteViewController.swift
//  Notes
//
//  Created by Валентина Евдокимова on 28.08.2022.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var noteTitleField: UITextField!
    @IBOutlet weak var newNoteToolBar: UIToolbar!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var note : Note?
    var newNoteNavigationBar : NewNoteNavigationBar?
    var noteSceneType: NoteSceneType = .isCreatingNewNote
    weak var notesDelegate: NotesDelegate?
    var noteIndexPath = IndexPath(row: 0, section: 0)
    var notes: Notes? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationNavigationBar()
        //configureKeyboardNotifications()
        configureNoteWhileEditing()
        newNoteNavigationBar?.newNoteDelegate = self
        configureNoteIfEditing()
        
    }
    
    private func configureNoteIfEditing() {
      guard let note = self.note else { return }
      noteTitleField.text = note.title
      noteTextView.text = note.content
    }
    
    private func configurationNavigationBar() {
        newNoteNavigationBar = NewNoteNavigationBar(newNoteViewController: self)
        newNoteNavigationBar?.configurationNavigationItems()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        noteTitleField.becomeFirstResponder()
    }
    
    private func configureKeyboardNotifications() {
      let notificationCenter = NotificationCenter.default
      notificationCenter.addObserver(self, selector: #selector(adjustKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
      notificationCenter.addObserver(self, selector: #selector(adjustKeyboard), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    private func configureNoteWhileEditing() {
        guard let note = self.note else { return }
        noteTitleField.text = note.title
        noteTextView.text = note.content
    }
    @objc func adjustKeyboard(notification: Notification) {
      guard let keyboardValue: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
      let keyboardScreenFrame: CGRect = keyboardValue.cgRectValue
      
      let keyboardConvertedFrame = view.convert(keyboardScreenFrame, to: view.window)
      let textViewBottomInset = keyboardConvertedFrame.height - newNoteToolBar.frame.height
      noteTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: textViewBottomInset, right: 0)
        noteTextView.scrollIndicatorInsets = noteTextView.contentInset
      let selectedRange = noteTextView.selectedRange
        noteTextView.scrollRangeToVisible(selectedRange)
    }
}



