//
//  SettingsEntry.swift
//  Sage
//
//  Created by Gabriel Celis on 12/9/24.
//

import SwiftUI

struct SettingsEntry: View {
    var textScalar: CGFloat
    var headline: String
    var description: String

    private var headlineFontSize: CGFloat {
        14 * textScalar
    }

    private var descriptionFontSize: CGFloat {
        8 * textScalar + 0.5
    }

    var body: some View {
        VStack(spacing: 6) {
            Text(headline)
                .font(.system(size: headlineFontSize))
                .fontWeight(.light)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(description)
                .font(.system(size: descriptionFontSize))
                .fontWeight(.light)
                .frame(maxWidth: .infinity, alignment: .leading)
                .opacity(0.6)
                .lineLimit(2)
        }
    }
}

#Preview {
    SettingsEntry(
        textScalar: 1.5,
        headline: "Hello",
        description: "World!")
}
