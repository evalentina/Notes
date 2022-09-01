//
//  Note.swift
//  Notes
//
//  Created by Валентина Евдокимова on 29.08.2022.
//

import Foundation

class Note: Codable, Identifiable {
    
    var title: String
    var content: String
    var id = UUID()
    var date = Date()
    var pinn: Bool = false
    
    init(title: String, content: String) {
        
        self.title = title
        self.content = content
    }
}
