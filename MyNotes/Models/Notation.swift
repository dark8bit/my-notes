//
//  Notation.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 22.09.2022.
//

import Foundation

struct Notation {
    let title: String
    let description: String
    let date: Date
    let content: String?
    let contentType: NameType?
    
    init(title: String, description: String, date: Date, content: String? = nil, contentType: NameType? = nil) {
        self.title = title
        self.description = description
        self.date = date
        self.content = content
        self.contentType = contentType
    }
}
