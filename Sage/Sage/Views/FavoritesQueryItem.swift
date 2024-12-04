//
//  FavoritesQueryItem.swift
//  Sage
//
//  Created by Gabriel Celis on 9/30/24.
//

import SwiftUI

struct FavoritesQueryItem: View {
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
                    .opacity(0.8)
                Text(pronounciation)
                    .font(.subheadline)
                    .foregroundColor(.favoritesQueryItemHint)
                    .lineLimit(1)
            }

            Text(definition)
                .font(.system(size: textDefinitionSize))
                .lineLimit(2)
        }
        .foregroundColor(.accentColor)
    }
}

#Preview {
    FavoritesQueryItem(
        word: "Hedonism", pronounciation: "ˈhēdnˌizəm, ˈhēdəˌnizəm",
        definition: "The pursuit of pleasure and happiness.")
}
