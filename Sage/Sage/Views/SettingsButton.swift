//
//  RotatingSymbol.swift
//  Sage
//
//  Created by Gabriel Celis on 12/1/24.
//

import SwiftUI

struct SettingsButton: View {
    static private let rotationAnimationDuration: Double = 0.55

    let symbolSize: CGFloat
    @Binding var isSettingsButtonRotating: Bool
    @Binding var settingsButtonRotationAngle: Double
    @Binding var toSettingsPage: Bool
    @Binding var settings: Settings

    var body: some View {
        ZStack {
            if isSettingsButtonRotating {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(settingsButtonRotationAngle))
            } else {
                Image(systemName: "gearshape")
                    .resizable()
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .transition(.opacity)
                    .rotationEffect(.degrees(settingsButtonRotationAngle))
            }
        }
        .navigationDestination(
            isPresented: $toSettingsPage,
            destination: {
                SettingsView(settings: $settings)
                    .onAppear {
                        isSettingsButtonRotating = false
                        settingsButtonRotationAngle = 0
                    }
            }
        )
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isSettingsButtonRotating.toggle()

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(
                        .easeInOut(
                            duration: SettingsButton.rotationAnimationDuration)
                    ) {
                        settingsButtonRotationAngle =
                            isSettingsButtonRotating ? 360 : 0
                    }

                    DispatchQueue.main.asyncAfter(
                        deadline: .now()
                            + SettingsButton.rotationAnimationDuration + 0.1
                    ) {
                        toSettingsPage.toggle()
                    }
                }
            }

        }

    }
}

#Preview {
    SettingsButton(
        symbolSize: 32, isSettingsButtonRotating: .constant(false),
        settingsButtonRotationAngle: .constant(0),
        toSettingsPage: .constant(false), settings: .constant(Settings())
    )
}
