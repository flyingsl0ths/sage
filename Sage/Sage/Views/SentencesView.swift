//
//  SentencesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/7/24.
//

import SwiftUI

struct SentencesView: View {
    private let textSize: CGFloat = 14.0

    private let tenses = [
        "BASE",
        "PRESENT I",
        "PAST I",
        "PRESENT II",
        "PAST II",
        "FUTURE",
    ]

    var sentences: [String]
    var word: String

    @State private var activeTense: String = "BASE"

    var body: some View {
        VStack(spacing: 50) {
            Text("Sentences").font(.largeTitle).underline().frame(
                maxWidth: .infinity, alignment: .leading
            )
            .padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 0))

            HStack(spacing: 4) {
                ScrollView {
                    VStack(spacing: 70) {
                        ForEach(tenses, id: \.hash) { tense in
                            Button(action: {
                                activeTense = tense
                            }) {
                                VStack {
                                    Text(tense)
                                        .lineLimit(1)
                                        .padding(.bottom, -8)
                                        .overlay(
                                            tense == activeTense
                                                ? RoundedRectangle(
                                                    cornerRadius: 20.0
                                                )
                                                .frame(height: 1)
                                                .offset(y: 15)
                                                : nil
                                        )
                                }
                            }
                            .foregroundColor(.black)
                            .rotationEffect(.degrees(-90))
                            .font(.system(size: textSize))
                            .padding(0)
                        }
                    }
                    .padding(
                        EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
                    )
                    .frame(width: 73)

                }.padding(0)

                ScrollView {
                    VStack(spacing: 35) {
                        ForEach(sentences, id: \.hash) { sentence in
                            SentenceItem(
                                bgColor: Color(hex: Palette.randomColor()),
                                text: sentence)
                        }
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
        }.padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
    }
}

#Preview {
    let sentences: [String] = [
        "Hedonism promotes the pursuit of pleasure as the highest good.",
        "Many philosophers debate the merits of hedonism in ethical discussions.",
        "Hedonism often emphasizes the importance of immediate gratification.",
        "Some people view hedonism as a lifestyle choice that prioritizes enjoyment.",
        "Critics argue that hedonism can lead to a superficial understanding of happiness.",
    ]

    SentencesView(
        sentences: sentences, word: "Hedonism")
}
