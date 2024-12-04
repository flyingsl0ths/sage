//
//  FavoritesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/21/24.
//

import SwiftUI

struct FavoritesView: View {
    @ScaledMetric private var cardPadding: CGFloat = 64
    @State private var currentIndex: Int = 0

    @Binding var favorites: [Favorite]

    var body: some View {
        VStack(spacing: 40) {
            let total = favorites.count
            Text("Favorites").font(.largeTitle).underline().frame(
                maxWidth: .infinity, alignment: .center
            )

            ZStack {
                ForEach(favorites, id: \.self) { favorite in
                    WordCard(
                        word: favorite,
                        total: total,
                        currentIndex: $currentIndex
                    ) { updatedIndex in
                        swapCard(next: updatedIndex)
                    }
                    .padding(cardPadding)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: 24) {
                Button(action: {}) {
                    Image(systemName: "text.alignleft")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }

                Button(action: {}) {
                    Image(systemName: "waveform")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }

                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }

                Button(action: {}) {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
        }
        .padding(.vertical, 32)
    }

    private func swapCard(next: Int) {
        favorites.swapAt(favorites.count - 1, next)
    }

}

#Preview {
    FavoritesView(
        favorites: .constant(
            [
                Favorite(
                    query: Query(
                        word: "Ephemeral",
                        pronounciation: "ih-FEM-er-uhl",
                        definition: "Lasting for a very short time"
                    ),
                    synonyms: ["fleeting", "transient", "short-lived"]
                ),
                Favorite(
                    query: Query(
                        word: "Ineffable",
                        pronounciation: "in-EF-uh-buhl",
                        definition:
                            "Too great or extreme to be expressed in words"
                    ),
                    synonyms: ["indescribable", "unspeakable", "inexpressible"]
                ),
                Favorite(
                    query: Query(
                        word: "Serendipity",
                        pronounciation: "seh-ren-DIP-ih-tee",
                        definition:
                            "The occurrence of events by chance in a happy or beneficial way"
                    ),
                    synonyms: ["fluke", "luck", "coincidence"]
                ),
                Favorite(
                    query: Query(
                        word: "Ebullient",
                        pronounciation: "ih-BUHL-yuhnt",
                        definition:
                            "Full of energy, enthusiasm, and cheerfulness"
                    ),
                    synonyms: ["exuberant", "elated", "vivacious"]
                ),
                Favorite(
                    query: Query(
                        word: "Luminous",
                        pronounciation: "LOO-muh-nuhs",
                        definition:
                            "Full of or shedding light; bright or shining, especially in the dark"
                    ),
                    synonyms: ["radiant", "brilliant", "shining"]
                ),
            ]
        ))
}
