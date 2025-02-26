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
    @State private var toWordView = false
    @State private var showCopiedToClipboardPopup = false
    @Binding var query: String
    @Binding var lastQuery: Word
    @Binding var favorites: [Word]

    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle).underline().frame(
                    maxWidth: .infinity, alignment: .leading
                )
                .padding(.vertical, 16)
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
                    .padding(.horizontal, 66)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            let iconSize = 28.0

            HStack(spacing: 24) {
                Button(action: {}) {
                    NavigationLink(destination: {
                        SentencesView(
                            sentences: SampleData.baseSentences,
                            word: "Hedonism")
                    }) {
                        Icon(iconName: "text.alignleft", iconSize: iconSize)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 1)
                            )

                    }
                }

                Button(action: { toWordView = true }) {
                    Icon(iconName: "book", iconSize: iconSize)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }

                Button(action: { showSearchSheet = true }) {
                    Icon(iconName: "plus", iconSize: iconSize)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }.sheet(
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
                    })
            }
        }

        .navigationDestination(
            isPresented: $toWordView,
            destination: {
                WordView(
                    word: favorites[currentIndex],
                    canAddToFavorites: false,
                    favorites: $favorites
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
        .padding(.vertical, 12)
        .frame(maxHeight: .infinity)
        .zIndex(0)
        .onAppear {
            currentIndex = favorites.count - 1
        }
    }
}

#Preview {
    FavoritesView(
        query: .constant(""), lastQuery: .constant(SampleData.favorite),
        favorites: .constant(SampleData.favorites))
}
