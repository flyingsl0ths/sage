//
//  Query.swift
//  Sage
//
//  Created by Gabriel Celis on 10/20/24.
//

struct Word: Hashable, Equatable {
    var word: String = ""
    var pronounciation: String = ""
    var definition: String = ""
    var synonyms: [String] = []
    var antonyms: [String] = []
    var sentences: [String: [String]] = [:]

    var isEmpty: Bool {
        word.isEmpty && pronounciation.isEmpty && definition.isEmpty
            && synonyms.isEmpty
    }
}
