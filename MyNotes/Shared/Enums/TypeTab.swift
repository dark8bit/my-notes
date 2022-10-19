//
//  TypeTabEnum.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 30.09.2022.
//

struct TypeTab {
    let name: NameType
    var isChecked: Bool
}

enum NameType: String, CaseIterable {
    case all = "All Notes"
    case reminder = "Reminder"
    case audio = "Audio"
    case images = "Images"
    case notifications = "Notifications"
}
