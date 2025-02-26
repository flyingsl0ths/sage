//
//  Icon.swift
//  Sage
//
//  Created by Gabriel Celis on 2/24/25.
//

import SwiftUI

struct Icon: View {
    private var iconName: String
    private var iconSize: CGFloat

    init(iconName: String, iconSize: CGFloat = 28.0) {
        self.iconName = iconName
        self.iconSize = iconSize
    }

    var body: some View {
        Image(systemName: iconName)
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconSize, height: iconSize)
            .foregroundStyle(.black)
    }
}

#Preview {
    Icon(iconName: "plus")
}
