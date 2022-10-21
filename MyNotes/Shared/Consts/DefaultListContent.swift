//
//  DefaultListContent.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 20.10.2022.
//

let DefaultListContent: [NameType: ContentType] = [
    NameType.audio: ContentType(icon: .audio, color: .red),
    NameType.images: ContentType(icon: .photo, color: .yellow),
    NameType.reminder: ContentType(icon: .note, color: .green),
    NameType.notifications: ContentType(icon: .bell, color: .primary),
]

struct ContentType {
    let icon: IconType
    let color: ColorType
}

enum ColorType: String {
    case green = "GreenType"
    case red = "RedType"
    case primary = "PrimaryType"
    case yellow = "YellowType"
}

enum IconType: String {
    case note = "note"
    case audio = "music.note"
    case bell = "bell"
    case photo = "photo"
}

