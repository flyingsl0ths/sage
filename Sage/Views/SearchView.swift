//
//  AddToFavoritesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/20/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var query: String
    @Binding var exitOnTap: Bool
    @Binding var toSearchQueryView: Bool
    @Binding var lastQuery: Word
    @Binding var favorites: [Word]
    @State private var results: [Word] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            SearchBar(searchQuery: $query)

            ZStack {
                if results.isEmpty {
                    NoResultsAnimation()
                        .zIndex(1.0)
                        .offset(y: -25)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center)
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(results, id: \.self) { result in
                                SearchQuery(
                                    word: result.word,
                                    pronounciation: result.phonetics,
                                    definition: result.definition
                                )
                                .padding(.vertical, 4)
                                .onTapGesture {
                                    toSearchQueryView = true
                                    exitOnTap = false
                                    lastQuery = result
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SearchView(
        query: .constant("hello"),
        exitOnTap: .constant(false),
        toSearchQueryView: .constant(false),
        lastQuery: .constant(
            SampleData.queryResults[0]
        ),
        favorites: .constant(SampleData.favorites)
    )
}
