//
//  WordCard.swift
//  Sage
//
//  Created by Gabriel Celis on 10/28/24.
//

import SwiftUI

struct WordCard: View {
    private let title: CGFloat = 34
    private let subTitle: CGFloat = 16
    private let buttonFontSize: CGFloat = 12

    let word: Favorite
    let total: Int

    @Binding var currentIndex: Int
    let onSwiped: (_: Int) -> Void

    @State private var offset = CGSize.zero
    @State private var rotation: Double = 0

    var body: some View {
        let query = word.query
        VStack(spacing: 60) {
            VStack(spacing: 8) {
                Text(query.word)
                    .font(.system(size: title))
                    .frame(
                        maxWidth: .infinity, alignment: .leading)

                Text(query.pronounciation)
                    .opacity(0.7)
                    .font(.system(size: subTitle))
                    .frame(
                        maxWidth: .infinity, alignment: .leading)
            }

            Text(query.definition)
                .opacity(0.7)
                .font(.system(size: subTitle))
                .lineLimit(3)
                .multilineTextAlignment(.leading)
                .frame(
                    maxWidth: .infinity, alignment: .leading)

            VStack(spacing: 16) {
                Text("Synonyms")
                    .font(.system(size: subTitle))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 24) {
                    ForEach(word.synonyms, id: \.self) { synonym in
                        Button(action: {}) {
                            Text(synonym)
                                .font(.system(size: buttonFontSize))
                                .foregroundStyle(.black)
                                .padding(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }
                    }
                }
                .frame(
                    maxWidth: .infinity, alignment: .leading)

                Text("...")
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

        }.background(
            RoundedRectangle(cornerRadius: 40).fill(
                Color(hex: Palette.fromString(query.word))
            )
            .padding(-40)
        )
        .offset(offset)
        .rotationEffect(.degrees(Double(offset.width / 20)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    // Rotate with horizontal drag
                    rotation = Double(offset.width / 20)
                }
                .onEnded { _ in
                    if offset.width > 150 {
                        onSwipeRight()
                    } else if offset.width < -150 {
                        onSwipeLeft()
                    }

                    // Resets the card to it's original state
                    // if user abruptly let's go of the card
                    offset = .zero
                    rotation = 0
                }
        )
        .animation(.spring(), value: offset)

    }

    func onSwipeRight() {
        let next = (currentIndex + 1) % total
        onSwiped(next)
        currentIndex = next
    }

    func onSwipeLeft() {
        var next = currentIndex
        if next == 0 {
            if total > 1 {
                next = total - 2
            }
        } else {
            next = (currentIndex - 1) % total
        }

        onSwiped(next)
        currentIndex = next

    }
}

#Preview {
    WordCard(
        word: Favorite(
            query: Query(
                word: "Serendipity",
                pronounciation: "seh-ren-DIP-uh-tee",
                definition:
                    "The occurrence of events by chance in a happy or beneficial way."
            ),
            synonyms: [
                "fluke", "fortune", "luck", "coincidence", "happy accident",
            ]
        ),

        total: 5,
        currentIndex: .constant(0)
    ) { _ in }
}
