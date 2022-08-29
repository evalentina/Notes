//
//  Note.swift
//  Notes
//
//  Created by Валентина Евдокимова on 29.08.2022.
//

import Foundation

class Note: Codable, Identifiable {
    
    var title: String
    var body: String
    var id = UUID()
    var date = Date()
    var pinned: Bool = false
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
