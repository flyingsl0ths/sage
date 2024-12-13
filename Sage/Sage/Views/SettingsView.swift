//
//  SettingsView.swift
//  Sage
//
//  Created by Gabriel Celis on 12/8/24.
//

import SwiftUI

struct SettingsView: View {

    var body: some View {
        let textScale = 1.25

        VStack(spacing: 32) {
            Text("Settings").font(.largeTitle).underline().frame(
                maxWidth: .infinity, alignment: .leading
            )
            .padding(.vertical, 16)

            let toggleScalar: CGFloat = 1.25
            let toggle: (Bool) -> Void = { _ in }
            let toggleOffset: CGFloat = 5

            HStack {
                SettingsEntry(
                    textScalar: textScale,
                    headline: "Light mode",
                    description: "Change the application's theme"
                )
                Toggle(
                    scalar: toggleScalar,
                    handleOn: { toggle(true) },
                    handleOff: { toggle(false) }
                )
                .offset(y: -toggleOffset)
            }

            HStack {
                SettingsEntry(
                    textScalar: textScale,
                    headline: "Marquee title",
                    description:
                        "Display your favorite words up on\nthe small screen"
                )
                Toggle(
                    scalar: toggleScalar,
                    handleOn: { toggle(true) },
                    handleOff: { toggle(false) }
                )
                .offset(y: -toggleOffset)
            }

            HStack {
                SettingsEntry(
                    textScalar: textScale,
                    headline: "Accent picker",
                    description: "Change the application's main color"
                )
                Circle()
                    .foregroundStyle(.accent)
                    .frame(width: 24, height: 24)
                    .scaleEffect(toggleScalar + 0.25)
                    .offset(y: -toggleOffset)
            }

            HStack {
                SettingsEntry(
                    textScalar: textScale,
                    headline: "Donations",
                    description:
                        "Consider donating to support the\ndevelopment of Sage"
                )
                Image("PatreonIcon")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.accent)
                    .frame(width: 20, height: 19)
                    .scaleEffect(toggleScalar + 0.25)
                    .offset(y: -toggleOffset)
            }

        }.padding(.horizontal, 28)
            .offset(y: 15)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    SettingsView()
}
