//
//  AlertSheets.swift
//  Notes
//
//  Created by Валентина Евдокимова on 30.08.2022.
//

import Foundation
import UIKit

class AlertSheets {
    
    var homeViewController : HomeViewController?
    
    @objc open func alertConfiguration() {
        let alert = UIAlertController(title: "Notes", message: nil, preferredStyle: .actionSheet)
        let viewAsGallery = UIAlertAction(title: "View as gallery", style: .default)
        let selectNotes = UIAlertAction(title: "Select notes", style: .default)
        
        alert.addAction(viewAsGallery)
        alert.addAction(selectNotes)
        homeViewController?.present(alert, animated: true)
    }
}
