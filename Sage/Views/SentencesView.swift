//
//  SentencesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/7/24.
//

import SwiftUI

struct SentencesView: View {
    private let textSize: CGFloat = 14.0

    var word: String
    var sentences: [String: [String]]
    var tenses: [String] = []

    @State private var activeTense: String = ""
    @State private var text: [String] = []

    var body: some View {
        VStack(spacing: 50) {
            Text("Sentences").font(.largeTitle).underline().frame(
                maxWidth: .infinity, alignment: .leading
            )
            .offset(x: 70)

            HStack(spacing: 4) {
                ScrollView {
                    VStack(spacing: 70) {
                        ForEach(sentences.keys.compactMap { $0 }, id: \.hash) {
                            tense in
                            Button(action: {
                                activeTense = tense
                                text = sentences[activeTense]!.compactMap { $0 }
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
                        }
                    }
                    .offset(y: 15)

                    .frame(width: 73)

                }

                ScrollView {
                    VStack(spacing: 35) {
                        ForEach(
                            text,
                            id: \.hash
                        ) {
                            sentence in
                            SentenceItem(
                                bgColor: Color(hex: Palette.randomColor()),
                                text: sentence)
                        }
                    }
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 25))
        }.offset(y: 15)
            .onAppear {
                activeTense = tenses.first!
                text = sentences[activeTense]!.compactMap { $0 }
            }
    }
}

#Preview {
    let sentences = SampleData.favorite.sentences

    SentencesView(
        word: SampleData.favorite.word,
        sentences: sentences, tenses: sentences.keys.compactMap { $0 })
}
