//
//  SearchIcon.swift
//  Sage
//
//  Created by Gabriel Celis on 12/13/24.
//

import SwiftUI

struct SearchIcon: View {
    var body: some View {
        Image(systemName: "magnifyingglass")
            .resizable()
            .frame(width: 24, height: 24)
            .aspectRatio(contentMode: .fit)
            .frame(alignment: .leading)
    }
}

#Preview {
    SearchIcon()
}
