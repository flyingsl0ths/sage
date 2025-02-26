//
//  SettingsView.swift
//  Sage
//
//  Created by Gabriel Celis on 12/8/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var showColorPicker = false
    @Binding var settings: Settings

    var body: some View {
        let viewScaling = 1.45
        ZStack {

            let colorPickerOffset = 10.0

            AccentPicker(
                showColorPicker: $showColorPicker,
                selectedColor: $settings.accentColor
            )
            .offset(y: showColorPicker ? colorPickerOffset : -colorPickerOffset)
            .opacity(showColorPicker ? 1.1 : -1.0)
            .zIndex(1)

            VStack(spacing: 32) {
                Text("Settings").font(.largeTitle).underline().frame(
                    maxWidth: .infinity, alignment: .leading
                )

                let toggleScalar: CGFloat = 1.4
                let toggleOffset: CGFloat = 5

                HStack {
                    SettingsEntry(
                        textScalar: viewScaling,
                        headline: "Light mode",
                        description: "Change the application's theme"
                    )
                    Toggle(
                        scalar: toggleScalar,
                        handleOn: { settings.mode = .light },
                        handleOff: { settings.mode = .dark }
                    )
                    .offset(y: -toggleOffset)
                }

                HStack {
                    SettingsEntry(
                        textScalar: viewScaling,
                        headline: "Marquee title",
                        description:
                            "Display your favorite words up on\nthe small screen"
                    )
                    Toggle(
                        scalar: toggleScalar,
                        handleOn: {
                            settings.marqueeAnimation.toggle()
                        },
                        handleOff: {
                            settings.marqueeAnimation.toggle()
                        }
                    )
                    .offset(y: -toggleOffset)
                }

                HStack {
                    SettingsEntry(
                        textScalar: viewScaling,
                        headline: "Accent picker",
                        description: "Change the application's main color"
                    )
                    Circle()
                        .foregroundStyle(.accent)
                        .frame(width: 24, height: 24)
                        .scaleEffect(toggleScalar + 0.25)
                        .offset(y: -toggleOffset)
                        .onTapGesture {
                            withAnimation(
                                .bouncy(duration: 0.5, extraBounce: 0.25)
                            ) {
                                showColorPicker.toggle()
                            }
                        }
                }

                HStack {
                    SettingsEntry(
                        textScalar: viewScaling,
                        headline: "Donations",
                        description:
                            "Consider donating to support the\ndevelopment of Sage"
                    )

                    ZStack {
                        Link(
                            "        ",
                            destination: URL(string: "https://www.apple.com")!
                        )
                        .foregroundStyle(.clear)
                        .background(.clear)
                        .zIndex(1)

                        Image("PatreonIcon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.accent)
                            .frame(width: 20, height: 19)
                            .scaleEffect(toggleScalar + 0.25)
                            .zIndex(0)
                    }
                    .offset(y: -toggleOffset)
                }

            }
            .padding(.horizontal, 30)
            .offset(y: 15)
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    SettingsView(settings: .constant(Settings()))
}
