//
//  LikeButton.swift
//  Sage
//
//  Created by Gabriel Celis on 12/1/24.
//

import SwiftUI

struct FavoritesButton: View {
    @State private var isLiked: Bool = false
    @State private var animateScale: CGSize = .zero

    var size: CGFloat = 100

    var body: some View {
        ZStack {
            Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .foregroundColor(.gray)

            if isLiked {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.favoritesIcon)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(.gray)
                    .scaleEffect(animateScale)
                    .animation(
                        .spring(response: 0.35, dampingFraction: 0.5),
                        value: animateScale)
            }
        }
        .onTapGesture {
            withAnimation {
                isLiked.toggle()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let updatedAnimationScale = CGFloat(isLiked ? 1.3 : 1.0)

                animateScale = CGSize(
                    width: updatedAnimationScale, height: updatedAnimationScale)
            }
        }
    }
}

#Preview {
    FavoritesButton()
}
