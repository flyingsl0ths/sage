//
//  User.swift
//  Sage
//
//  Created by Gabriel Celis on 1/21/25.
//
import SwiftUI

struct User {
    var settings: Settings = Settings()
    var lastQuery: Word = Word()
    var favorites: [Word] = SampleData.favorites.shuffled()
    var query: String = ""
    var accentColor: Color = .accent
}
