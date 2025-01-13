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
    @State private var showCopiedToClipboardPopup = false
    @Binding var favorites: [Favorite]

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

            ZStack {
                ForEach(favorites, id: \.self) { favorite in
                    WordCard(
                        word: favorite,
                        total: favorites.count,
                        currentIndex: $currentIndex,
                        copiedToClipboard: $showCopiedToClipboardPopup
                    ) { updated in
                        swapCard(next: updated)
                    }
                    .padding(.horizontal, 66)
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
                        SearchView(
                            exitOnTap: $showSearchSheet,
                            toSearchQueryView: $toSearchQueryView
                        )
                        .padding(.vertical, 48)
                        .presentationDetents([.medium, .large])
                    })
            }
        }
        .padding(.vertical, 12)
        .frame(maxHeight: .infinity)
        .zIndex(0)
        .onAppear {
            currentIndex = favorites.count - 1
        }
        .navigationDestination(
            isPresented: $toSearchQueryView,
            destination: {
                SearchQueryView()
                    .onDisappear {
                        toSearchQueryView = false
                        showSearchSheet = true
                    }
            }
        )
    }

    private func swapCard(next: Int) {
        favorites.swapAt(favorites.count - 1, next)
    }

}

#Preview {
    FavoritesView(
        favorites: .constant(SampleData.favorites))
}
