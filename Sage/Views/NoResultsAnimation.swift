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

    var body: some View {
        VStack(spacing: 20) {
            Icon(iconName: "face.smiling", iconSize: 58)
                .rotationEffect(.degrees(rotation))
                .onAppear {
                    withAnimation(.bouncy(duration: 0.9, extraBounce: 0.25)) {
                        rotation += 180
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.30) {
                        withAnimation(.easeInOut(duration: 0.95)) {
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
