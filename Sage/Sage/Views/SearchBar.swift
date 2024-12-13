//
//  SearchBar.swift
//  Sage
//
//  Created by Gabriel Celis on 9/24/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String

    var onSearch: (Binding<String>) -> Void = { _ in }

    var body: some View {
        HStack(spacing: 30.0) {
            SearchField(searchQuery: $searchQuery)

            SearchIcon()
                .onTapGesture {
                    onSearch($searchQuery)
                }
        }
        .padding([.leading, .trailing], 32)
    }
}

#Preview {
    SearchBar(searchQuery: .constant(""))
}
