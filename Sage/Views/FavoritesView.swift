//
//  FavoritesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/21/24.
//

import SwiftUI

struct FavoritesView: View {
    @State private var currentIndex = 0
    @State private var showSearchSheet = false
    @State private var toSearchQueryView = false
    @State private var toSentencesView = false
    @State private var toWordView = false
    @State private var showCopiedToClipboardPopup = false
    @Binding var query: String
    @Binding var lastQuery: Word
    @Binding var favorites: [Word]

    var body: some View {
        VStack(spacing: 0) {
            Text("Favorites")
                .font(.largeTitle).underline().frame(
                    maxWidth: .infinity, alignment: .leading
                )
                .padding(.horizontal, 36)

            let copiedToClipboardOffset = 16.0

            Text("Copied to clipboard")
                .zIndex(1)
                .foregroundStyle(.black)
                .offset(
                    y: showCopiedToClipboardPopup
                        ? copiedToClipboardOffset : -copiedToClipboardOffset
                )
                .opacity(showCopiedToClipboardPopup ? 0.8 : 0)
                .animation(
                    .bouncy(duration: 0.8),
                    value: showCopiedToClipboardPopup
                )
                .background(
                    RoundedRectangle(cornerRadius: 28)
                        .offset(
                            y: showCopiedToClipboardPopup
                                ? copiedToClipboardOffset
                                : -copiedToClipboardOffset
                        )
                        .animation(
                            .bouncy(duration: 0.8),
                            value: showCopiedToClipboardPopup
                        )
                        .padding(-18)
                        .foregroundStyle(
                            .gray.opacity(
                                showCopiedToClipboardPopup ? 0.2 : 0
                            )))

            let swapCard = {
                (next: Int) in
                favorites.swapAt(favorites.count - 1, next)
            }

            ZStack {
                ForEach(favorites, id: \.self) { favorite in
                    WordCard(
                        word: favorite,
                        total: favorites.count,
                        currentIndex: $currentIndex,
                        copiedToClipboard: $showCopiedToClipboardPopup
                    ) { updated in
                        swapCard(updated)
                    }
                    .padding(.horizontal, 72)
                }
                .frame(maxHeight: .infinity)
            }
            .onAppear {
                currentIndex = favorites.count - 1
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            WordToolbar(
                toSentencesView: $toSentencesView, toWordView: $toWordView,
                showSearchSheet: $showSearchSheet)
        }
        .navigationDestination(
            isPresented: $toSentencesView,
            destination: {
                let word = favorites.last!
                SentencesView(
                    word: word.word, sentences: word.sentences,
                    tenses: word.sentences.keys.compactMap { $0 }
                )
                .onDisappear {
                    toSentencesView = false
                }
            }
        )
        .navigationDestination(
            isPresented: $toWordView,
            destination: {
                WordView(
                    word: favorites.last!,
                    canAddToFavorites: false,
                    favorites: .constant(favorites)
                )
                .padding([.top], 16)
                .onDisappear {
                    toWordView = false
                }
            }
        )
        .navigationDestination(
            isPresented: $toSearchQueryView,
            destination: {
                WordView(
                    word: lastQuery,
                    canAddToFavorites: !favorites.contains(lastQuery),
                    favorites: $favorites
                )
                .padding([.top], 16)
                .onDisappear {
                    toSearchQueryView = false
                    showSearchSheet = true
                }
            }
        )
        .sheet(
            isPresented: $showSearchSheet,
            content: {
                SearchView(
                    query: $query,
                    exitOnTap: $showSearchSheet,
                    toSearchQueryView: $toSearchQueryView,
                    lastQuery: $lastQuery,
                    favorites: $favorites
                )
                .padding(.vertical, 48)
                .presentationDetents([.medium, .large])
            }
        )
        .padding(.vertical, 10)
        .frame(maxHeight: .infinity)
        .zIndex(0)
    }
}

#Preview {
    FavoritesView(
        query: .constant(""), lastQuery: .constant(SampleData.favorite),
        favorites: .constant(SampleData.favorites))
}
