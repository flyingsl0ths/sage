//
//  ContentView.swift
//  Sage
//
//  Created by Gabriel Celis on 9/16/24.
//

import SwiftUI

struct HomeView: View {
    static private var springAnimationDuration: Double = 0.2825

    @State var animateScale: CGSize = 1.0.toCGSize()
    @State var search: Bool = false
    @State var toSearchView = false
    @State var toSearchQueryView = false
    @State var toSettingsPage = false
    @State var isSettingsButtonRotating = false
    @State var settingsButtonRotationAngle: Double = 0.0
    @State var user: User = User()

    var body: some View {
        let symbolSize: CGFloat = 24
        let bottomBarPadding = 16.0

        NavigationStack {
            VStack(spacing: 30) {
                Spacer()

                Text("Sage").font(.largeTitle)
                    .scaleEffect(animateScale)

                SearchBar(searchQuery: $user.query) { query in
                    if query.wrappedValue.isEmpty {
                        return
                    }

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
                        SearchView(
                            query: $user.query,
                            exitOnTap: .constant(false),
                            toSearchQueryView: $toSearchQueryView,
                            lastQuery: $user.lastQuery,
                            favorites: $user.favorites
                        )
                        .navigationDestination(
                            isPresented: $toSearchQueryView,
                            destination: {
                                WordView(
                                    word: user.lastQuery,
                                    canAddToFavorites: !user.favorites.contains(
                                        user.lastQuery),
                                    favorites: .constant(user.favorites)
                                )
                                .padding([.top], 16)
                                .onDisappear {
                                    toSearchQueryView = false
                                }
                            }
                        )
                        .padding([.top], 16)
                    })

                Spacer()

                HStack {
                    SettingsButton(
                        symbolSize: symbolSize,
                        isSettingsButtonRotating:
                            $isSettingsButtonRotating,
                        settingsButtonRotationAngle:
                            $settingsButtonRotationAngle,
                        toSettingsPage: $toSettingsPage,
                        settings: $user.settings
                    )
                    .onDisappear {
                        Task {
                            await user.updateSettings()
                        }
                    }

                    Spacer()

                    FavoritesButton(
                        favorites: $user.favorites,
                        query: $user.query,
                        lastQuery: $user.lastQuery,
                        size: symbolSize
                    )
                }.padding(
                    EdgeInsets(
                        top: 0, leading: 30, bottom: bottomBarPadding,
                        trailing: 30)
                )
            }
            .onAppear {
                search = false
                toSearchView = false

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation(
                        .bouncy(duration: 0.25)
                    ) {
                        animateScale = 1.0.toCGSize()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
