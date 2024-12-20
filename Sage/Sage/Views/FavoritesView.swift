//
//  FavoritesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/21/24.
//

import SwiftUI

struct FavoritesView: View {
    @ScaledMetric private var cardPadding: CGFloat = 64
    @State private var currentIndex: Int = SampleData.favorites.count - 1
    @State private var showSearchSheet = false
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
                    ) { current, updated in
                        swapCard(current: current, next: updated)
                    }
                    .padding(cardPadding)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            HStack(spacing: 24) {
                Button(action: {}) {
                    NavigationLink(destination: {
                        SentencesView(
                            sentences: SampleData.baseSentences,
                            word: "Hedonism")
                    }) {
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

                Button(action: { showSearchSheet = true }) {
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
                }.sheet(
                    isPresented: $showSearchSheet,
                    content: {
                        AddToFavoritesView()
                            .padding(.vertical, 48)
                            .presentationDetents([.medium, .large])
                    })
            }
        }
        .padding(.vertical, 32)
    }

    private func swapCard(current: Int, next: Int) {
        favorites.swapAt(current, next)
    }

}

#Preview {
    FavoritesView(
        favorites: .constant(SampleData.favorites))
}
