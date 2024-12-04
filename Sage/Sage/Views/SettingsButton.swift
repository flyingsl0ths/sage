//
//  RotatingSymbol.swift
//  Sage
//
//  Created by Gabriel Celis on 12/1/24.
//

import SwiftUI

struct SettingsButton: View {
    let symbolSize: CGFloat
    @State private var isRotating = false
    @State private var rotationAngle: Double = 0.0

    var body: some View {
        ZStack {
            if isRotating {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: symbolSize, height: symbolSize)
                    .rotationEffect(.degrees(rotationAngle))
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
                    withAnimation(.easeInOut(duration: 1)) {
                        rotationAngle = isRotating ? 360 : 0
                    }
                }
            }
        }

    }
}

#Preview {
    SettingsButton(symbolSize: 32)
}
