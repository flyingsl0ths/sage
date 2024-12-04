//
//  SearchBar.swift
//  Sage
//
//  Created by Gabriel Celis on 9/24/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String
    @ScaledMetric private var padding = 32.0

    var body: some View {
        HStack(spacing: 30.0) {
            SearchField(searchQuery: $searchQuery)

            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 24, height: 24)
                .aspectRatio(contentMode: .fit)
                .frame(alignment: .leading)
        }
        .padding(
            EdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding))
    }
}

#Preview {
    SearchBar(searchQuery: .constant(""))
}
