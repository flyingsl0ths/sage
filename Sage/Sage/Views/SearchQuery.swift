//
//  FavoritesQueryItem.swift
//  Sage
//
//  Created by Gabriel Celis on 9/30/24.
//

import SwiftUI

struct SearchQuery: View {
    var word: String
    var pronounciation: String
    var definition: String
    private let textDefinitionSize: CGFloat = 16.0

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(word)
                    .font(.headline)
                    .lineLimit(1)
                Text("|")
                    .foregroundColor(.favoritesQueryItemHint)
                Text(pronounciation)
                    .font(.subheadline)
                    .foregroundColor(.favoritesQueryItemHint)
                    .lineLimit(1)
            }

            Text(definition)
                .font(.system(size: textDefinitionSize))
                .lineLimit(1)
        }
        .foregroundColor(.accentColor)

    }
}

#Preview {
    SearchQuery(
        word: "Hedonism", pronounciation: "ˈhēdnˌizəm, ˈhēdəˌnizəm",
        definition: "The pursuit of pleasure and happiness.")
}
