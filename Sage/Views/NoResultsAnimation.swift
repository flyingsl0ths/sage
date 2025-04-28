//
//  NoResultsAnimation.swift
//  Sage
//
//  Created by Gabriel Celis on 3/4/25.
//

import SwiftUI

struct NoResultsAnimation: View {
    @State private var rotation: CGFloat = 0
    @State private var textOpacity: CGFloat = 0
    @State private var iconScale: CGFloat = 0.5

    var body: some View {
        VStack(spacing: 20) {
            Icon(iconName: "books.vertical", iconSize: 58)
                .rotationEffect(.degrees(rotation))
                .scaleEffect(iconScale)
                .onAppear {
                    withAnimation(.bouncy(duration: 0.9, extraBounce: 0.25)) {
                        iconScale += 0.5
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.18) {
                        withAnimation(.easeIn(duration: 0.95)) {
                            textOpacity = 1.0
                        }
                    }
                }

            Text("Couldn't find a match...")
                .font(.title2)
                .opacity(textOpacity)
        }
    }
}

#Preview {
    NoResultsAnimation()
}
