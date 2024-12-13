//
//  LikeButton.swift
//  Sage
//
//  Created by Gabriel Celis on 12/1/24.
//

import SwiftUI

struct FavoritesButton: View {
    static private var springAnimationDuration: Double = 0.2825
    @State private var isLiked: Bool = false
    @State private var animateScale: CGSize = .zero
    @State private var toFavoritesPage: Bool = false

    @Binding var favorites: [Favorite]
    var size: CGFloat = 100

    var body: some View {
        ZStack {
            if isLiked {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.favoritesIcon)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(.gray)
                    .scaleEffect(animateScale)
                    .navigationDestination(
                        isPresented: $toFavoritesPage,
                        destination: {
                            FavoritesView(
                                favorites:
                                    $favorites
                            ).onAppear {
                                isLiked = false
                                animateScale = .zero
                            }
                        }
                    )
            } else {
                Image(systemName: "heart")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size, height: size)
                    .foregroundColor(.gray)
            }
        }
        .onTapGesture {
            withAnimation {
                isLiked.toggle()
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(
                    .spring(
                        response: FavoritesButton.springAnimationDuration,
                        dampingFraction: 0.5)
                ) {
                    let updatedAnimationScale = CGFloat(isLiked ? 1.3 : 1.0)

                    animateScale = CGSize(
                        width: updatedAnimationScale,
                        height: updatedAnimationScale)

                    DispatchQueue.main.asyncAfter(
                        deadline: .now()
                            + FavoritesButton.springAnimationDuration + 0.1
                    ) {
                        toFavoritesPage.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    FavoritesButton(
        favorites: .constant(SampleData.favorites))
}
