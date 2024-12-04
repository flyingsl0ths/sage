//
//  ContentView.swift
//  Sage
//
//  Created by Gabriel Celis on 9/16/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchQuery: String = ""
    private var symbolSize: CGFloat = 24
    private var symbolWidth: CGFloat = 24 + 2
    private var bottomBarPadding = 16.0

    var body: some View {
        VStack(spacing: 32) {
            Spacer()

            Text("Sage").font(.largeTitle)

            SearchBar(searchQuery: $searchQuery)

            Spacer()

            HStack {
                SettingsButton(symbolSize: symbolSize)

                Spacer()

                FavoritesButton(size: symbolSize)
            }.padding(
                EdgeInsets(
                    top: 0, leading: 32, bottom: bottomBarPadding, trailing: 32)
            )
        }
    }
}

#Preview {
    HomeView()
}
