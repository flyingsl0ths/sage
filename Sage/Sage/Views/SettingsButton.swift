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
    @State private var isRotating = false
    @State private var rotationAngle: Double = 0.0
    @State private var toSettingsPage: Bool = false

    var body: some View {
        ZStack {
            if isRotating {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(rotationAngle))
                    .navigationDestination(
                        isPresented: $toSettingsPage,
                        destination: {
                            SettingsView().onAppear {
                                isRotating = false
                                rotationAngle = 0
                            }
                        }
                    )
            } else {
                Image(systemName: "gearshape")
                    .resizable()
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .transition(.opacity)
                    .rotationEffect(.degrees(rotationAngle))
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)) {
                isRotating.toggle()

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(
                        .easeInOut(
                            duration: SettingsButton.rotationAnimationDuration)
                    ) {
                        rotationAngle = isRotating ? 360 : 0
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
    SettingsButton(symbolSize: 32)
}
