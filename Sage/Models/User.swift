//
//  User.swift
//  Sage
//
//  Created by Gabriel Celis on 1/21/25.
//
import SwiftUI

let ENDPOINT: String = ""
let FAVORITES_FILE = "favorites.json"
let SETTINGS_FILE = "settings.json"

@Observable class User {
    public var settings: Settings = Settings()
    public var lastQuery: Word = Word()
    public var favorites: [Word] = SampleData.favorites.shuffled()
    public var query: String = ""
    public var accentColor: Color = .accent

    func fetchWord(_ q: String) async throws -> Word? {
        guard let url = URL(string: "\(ENDPOINT)/\(q)")
        else { return nil }

        let (data, resp) = try await URLSession.shared.data(from: url)

        guard let httpResp = resp as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        guard httpResp.statusCode == 200 else {
            throw URLError(.init(rawValue: httpResp.statusCode))
        }

        let word = try JSONDecoder().decode(Word.self, from: data)

        lastQuery = word

        return lastQuery
    }

    func updateSettings() async {
        let updated = writeData(self.favorites, fileName: FAVORITES_FILE)

        if !updated {
            print("[SAGE]::updateFavorites: Failed to update favorites!")
        }
    }

    func updateFavorites() async {
        let updated = writeData(self.favorites, fileName: SETTINGS_FILE)

        if !updated {
            print("[SAGE]::updateSettings: Failed to update settings!")
        }
    }
}
