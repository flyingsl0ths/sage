//
//  AccentPicker.swift
//  Sage
//
//  Created by Gabriel Celis on 1/5/25.
//

import SwiftUI

struct AccentPicker: View {
    @Binding var showColorPicker: Bool
    @Binding var selectedColor: Color

    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 20) {
                ColorPicker("Select a color", selection: $selectedColor)

                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
                    .onTapGesture {
                        withAnimation(
                            .bouncy(duration: 0.5, extraBounce: 0.25)
                        ) {
                            showColorPicker.toggle()
                        }
                    }
            }

            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(selectedColor)
                .frame(height: 100)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(color: .gray.opacity(0.6), radius: 8, x: 0, y: 6)
                .padding(-22)
        )
        .padding(.horizontal, 36)
    }
}

#Preview {
    AccentPicker(
        showColorPicker: .constant(true),
        selectedColor: .constant(.blue))
}
