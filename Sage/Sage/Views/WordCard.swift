//
//  WordCard.swift
//  Sage
//
//  Created by Gabriel Celis on 10/28/24.
//

import SwiftUI

struct WordCard: View {
    @State private var offset = CGSize.zero
    @State private var rotation: Double = 0

    let word: Favorite
    let total: Int

    @Binding var currentIndex: Int
    @Binding var copiedToClipboard: Bool
    let onSwiped: (_: Int) -> Void

    var body: some View {
        let query = word.query

        let title: CGFloat = 34
        let subTitle: CGFloat = 16
        let buttonFontSize: CGFloat = 12

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
                        Button(action: {
                            UIPasteboard.general.string = synonym
                            copiedToClipboard.toggle()

                            DispatchQueue.main.asyncAfter(
                                deadline: .now() + 0.85
                            ) {
                                copiedToClipboard.toggle()
                            }
                        }) {
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
            RoundedRectangle(cornerRadius: 30).fill(
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
                    rotation = Double(offset.width / 20)
                }
                .onEnded { _ in
                    if offset.width > -150 {
                        let next = onSwipeRight()
                        currentIndex = next
                    } else if offset.width < 150 {
                        let next = onSwipeLeft()
                        currentIndex = next
                    }

                    offset = .zero
                    rotation = 0
                }
        )
        .animation(.spring(), value: offset)

    }

    func onSwipeRight() -> Int {
        let next =
            currentIndex + 1 == total - 1
            ? 0 : (currentIndex + 1) % total
        print("Right: \(next)")
        onSwiped(next)
        return next
    }

    func onSwipeLeft() -> Int {
        var next = (currentIndex - 1) % total
        if next < 0 {
            next = total - 2
        }
        print("Left: \(next)")
        onSwiped(next)
        return next
    }
}

#Preview {
    WordCard(
        word: SampleData.favorite,
        total: 5,
        currentIndex: .constant(0),
        copiedToClipboard: .constant(false)
    ) { _ in }
}
