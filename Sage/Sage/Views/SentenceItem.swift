//
//  SentenceView.swift
//  Sage
//
//  Created by Gabriel Celis on 10/7/24.
//

import SwiftUI

struct SentenceItem: View {
    var bgColor: Color
    var text: String
    private let textSize: CGFloat = 14.0

    var body: some View {
        ZStack {
            let frameHeight = 105.0
            let textPadding = 12.0
            let radius = 10.0

            RoundedRectangle(cornerRadius: radius)
                .foregroundStyle(bgColor)
                .frame(width: .infinity, height: frameHeight)
                .padding(0)

            Text(text)
                .frame(
                    width: .infinity, height: frameHeight, alignment: .center
                )
                .padding(
                    EdgeInsets(
                        top: 0, leading: textPadding, bottom: 0,
                        trailing: textPadding)
                )
                .font(.system(size: textSize))
                .lineLimit(2)
                .zIndex(1)
        }.padding(0)
    }
}

#Preview {
    SentenceItem(
        bgColor: Color(hex: Palette.fromString("Hedonism")),
        text: "The pursuit of pleasure; sensual self-indulgence.")
}
