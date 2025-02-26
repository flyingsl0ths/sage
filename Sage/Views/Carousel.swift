//
//  Carousel.swift
//  Sage
//
//  Created by Gabriel Celis on 12/26/24.
//

import SwiftUI

struct Carousel: View {
    @State private var currentIndex: Int = 0
    @State private var fade: Bool = false

    let items: [String]

    var body: some View {
        VStack(spacing: 0) {
            if !items.isEmpty {
                Text(items[currentIndex])
                    .lineLimit(3)
                    .opacity(fade ? 0 : 1)
                    .animation(.easeInOut(duration: 0.65), value: fade)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                fade = true
                            }
                            .onEnded { value in
                                fade = false
                                if value.translation.width < -50 {
                                    currentIndex =
                                        (currentIndex + 1) % items.count
                                } else if value.translation.width > 50 {
                                    currentIndex =
                                        (currentIndex - 1) % items.count
                                    if currentIndex == -1 {
                                        currentIndex = items.count - 1
                                    }
                                }
                            }
                    )

                HStack {
                    ForEach(items.indices, id: \.self) { i in
                        ZStack {
                            Circle()
                                .frame(width: 8, height: 8)
                                .zIndex(0)

                            Circle()
                                .frame(width: 4, height: 4)
                                .foregroundStyle(
                                    i == currentIndex ? .black : .white
                                )
                                .zIndex(1)
                        }
                    }
                }
                .padding(.top, 30)
            }

        }
    }

}

#Preview {
    Carousel(items: SampleData.baseSentences)
}
