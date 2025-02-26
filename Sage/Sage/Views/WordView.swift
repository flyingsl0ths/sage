//
//  QueryItemView.swift
//  Sage
//
//  Created by Gabriel Celis on 12/23/24.
//

import SwiftUI

struct WordView: View {
    static private var volumeIconAnimationDuration = 0.35

    var word: Word
    var canAddToFavorites: Bool = false
    @Binding var favorites: [Word]
    @State private var speechIconScale: Double = 1.0
    @State private var favoritesIconIconScale: Double = 1.0
    @State private var isSpeechIconTouched = false

    var body: some View {
        VStack(spacing: 0) {
            Carousel(items: word.synonyms)

            Spacer()

            Text(word.definition)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .lineLimit(3)

            Spacer()

            if !word.antonyms.isEmpty {
                Carousel(items: word.antonyms)
                    .padding(.bottom, 20)
            }

            VStack(spacing: 24) {
                Text(word.word)
                    .font(.system(size: 62))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 12) {
                    Text(word.pronounciation)
                        .font(.system(size: 24))

                    Image(systemName: "speaker.wave.2")
                        .resizable()
                        .foregroundStyle(.black)
                        .frame(width: 20, height: 20)
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(speechIconScale.toCGSize())
                        .onTapGesture {
                            isSpeechIconTouched = true
                            withAnimation(
                                .spring(
                                    response: WordView
                                        .volumeIconAnimationDuration,
                                    dampingFraction: 0.15)
                            ) {
                                speechIconScale = 1.15
                            }

                            DispatchQueue.main.asyncAfter(
                                deadline: .now()
                                    + WordView
                                    .volumeIconAnimationDuration
                            ) {
                                isSpeechIconTouched = false
                                speechIconScale = 1.0
                            }
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 24)

            RoundedRectangle(cornerRadius: 2)
                .frame(height: 4)
        }
        .toolbar(content: {
            Icon(iconName: "plus.circle").frame(
                maxWidth: .infinity, alignment: .topTrailing
            )
            .opacity(canAddToFavorites ? 1.0 : 0.5)
            .onTapGesture {
                if canAddToFavorites {
                    favorites.insert(word, at: 0)
                }
            }
        })
        .padding(.vertical, 18)
        .padding(.horizontal, 30)
    }
}

#Preview {
    WordView(
        word: SampleData.favorite, favorites: .constant(SampleData.favorites))
}
