//
//  SentencesView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/7/24.
//

import SwiftUI

struct SentencesView: View {
    private let textSize: CGFloat = 14.0

    static private let partsOfSpeech = SampleData.partsOfSpeech

    var sentences: [String]
    var word: String

    @State private var activeTense: String = SampleData.partsOfSpeech[0]

    var body: some View {
        VStack(spacing: 50) {
            Text("Sentences").font(.largeTitle).underline().frame(
                maxWidth: .infinity, alignment: .leading
            )
            .offset(x: 70)

            HStack(spacing: 4) {
                ScrollView {
                    VStack(spacing: 70) {
                        ForEach(SentencesView.partsOfSpeech, id: \.hash) {
                            tense in
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
                        }
                    }
                    .offset(y: 15)

                    .frame(width: 73)

                }

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
        }.offset(y: 15)
    }
}

#Preview {
    SentencesView(
        sentences: SampleData.baseSentences,
        word: "Hedonism")
}
