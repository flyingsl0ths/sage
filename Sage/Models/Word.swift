//
//  Query.swift
//  Sage
//
//  Created by Gabriel Celis on 10/20/24.
//

struct Word: Hashable, Equatable {
    var word: String = ""
    var phonetics: String = ""
    var definition: String = ""
    var synonyms: [String] = []
    var antonyms: [String] = []
    var sentences: [String: [String]] = [:]

    var isEmpty: Bool {
        word.isEmpty && phonetics.isEmpty && definition.isEmpty
            && synonyms.isEmpty
    }
}
