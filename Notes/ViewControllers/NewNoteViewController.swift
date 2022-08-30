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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureKeyboardNotifications()
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
