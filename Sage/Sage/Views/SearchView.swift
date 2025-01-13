//
//  AddToFavoritesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/20/24.
//

import SwiftUI

struct SearchView: View {
    @State private var word: String = ""
    @State private var results: [Query] = SampleData.queryResults

    @Binding var exitOnTap: Bool
    @Binding var toSearchQueryView: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            SearchBar(searchQuery: $word)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(results, id: \.word.hash) { result in
                        SearchQuery(
                            word: result.word,
                            pronounciation: result.pronounciation,
                            definition: result.definition
                        )
                        .padding(.vertical, 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            toSearchQueryView = true
                            exitOnTap = false
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    SearchView(exitOnTap: .constant(false), toSearchQueryView: .constant(false))
}
