//
//  ContentView.swift
//  Sage
//
//  Created by Gabriel Celis on 9/16/24.
//

import SwiftUI

struct HomeView: View {
    static private var springAnimationDuration: Double = 0.2825

    @State private var searchQuery: String = ""
    @State private var animateScale: CGSize = 1.0.toCGSize()
    @State private var search: Bool = false
    @State private var toSearchView = false

    @State private var favorites: [Favorite] = SampleData.favorites

    var body: some View {
        let symbolSize: CGFloat = 24
        let bottomBarPadding = 16.0

        NavigationStack {
            VStack(spacing: 32) {
                Spacer()

                Text("Sage").font(.largeTitle)
                    .scaleEffect(animateScale)

                SearchBar(searchQuery: $searchQuery) { _ in
                    withAnimation {
                        search = true
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(
                            .bouncy(duration: 0.3, extraBounce: 0.5)
                        ) {
                            animateScale = 1.3.toCGSize()
                        }
                    }

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        search = false

                        withAnimation(
                            .easeOut(duration: 0.3)
                        ) {
                            animateScale = 0.0.toCGSize()
                        }
                        toSearchView = true
                    }
                }
                .navigationDestination(
                    isPresented: $toSearchView,
                    destination: {
                        SearchView()
                            .padding([.top], 16)
                            .onDisappear {
                                withAnimation(
                                    .bouncy(duration: 0.25)
                                ) {
                                    animateScale = 1.0.toCGSize()
                                }

                                search = false
                                toSearchView = false
                            }
                    })

                Spacer()

                HStack {
                    SettingsButton(symbolSize: symbolSize)

                    Spacer()

                    FavoritesButton(
                        favorites: $favorites,
                        size: symbolSize
                    )
                }.padding(
                    EdgeInsets(
                        top: 0, leading: 30, bottom: bottomBarPadding,
                        trailing: 30)
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
