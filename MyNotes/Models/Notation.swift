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
    let contentType: NameType
    
    init(title: String, description: String, date: Date, contentType: NameType) {
        self.title = title
        self.description = description
        self.date = date
        self.contentType = contentType
    }
}
