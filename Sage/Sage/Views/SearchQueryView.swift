//
//  QueryItemView.swift
//  Sage
//
//  Created by Gabriel Celis on 12/23/24.
//

import SwiftUI

struct SearchQueryView: View {
    static private var volumeIconAnimationDuration = 0.35
    @State private var speechIconScale: Double = 1.0
    @State private var isSpeechIconTouched = false

    var body: some View {
        VStack(spacing: 0) {
            Text("An excited state of joy; a feeling of intense happiness.")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .lineLimit(3)

            Spacer()

            Carousel(items: SampleData.baseSentences)

            Spacer()

            VStack(spacing: 24) {
                Text("Euphoria")
                    .font(.system(size: 62))
                    .frame(maxWidth: .infinity, alignment: .leading)

                HStack(spacing: 12) {
                    Text("/juːˈfɔːɹi.ə/")
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
                                    response: SearchQueryView
                                        .volumeIconAnimationDuration,
                                    dampingFraction: 0.15)
                            ) {
                                speechIconScale = 1.15
                            }

                            DispatchQueue.main.asyncAfter(
                                deadline: .now()
                                    + SearchQueryView
                                    .volumeIconAnimationDuration
                            ) {
                                isSpeechIconTouched = false
                                speechIconScale = 1.0
                            }
                        }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(
                    """
                    late 17th century (denoting well-being produced in a sick person by the use of drugs): modern Latin, from Greek, from euphoros ‘borne well, healthy’, from eu ‘well’ + pherein ‘to bear’.
                    """
                )
                .font(.system(size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(5)
            }
            .padding(.bottom, 24)

            RoundedRectangle(cornerRadius: 2)
                .frame(height: 4)
        }
        .padding(.vertical, 18)
        .padding(.horizontal, 30)
    }
}

#Preview {
    SearchQueryView()
}
