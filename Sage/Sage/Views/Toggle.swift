//
//  Toggle.swift
//  Sage
//
//  Created by Gabriel Celis on 12/9/24.
//

import SwiftUI

struct Toggle: View {
    @State private var xOffset: CGFloat = 0
    @State private var isOn: Bool = false

    var scalar: CGFloat = 1.5
    var handleOn: () -> Void = {}
    var handleOff: () -> Void = {}

    private var size: CGFloat { 18 * scalar }
    private var offset: CGFloat { -(9 * 1.75 - scalar) }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.clear)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.black, lineWidth: 1)
                )
                .frame(width: 33 * scalar - 2, height: 10 * scalar - 0.5)
                .zIndex(0)

            Circle()
                .fill(.accent)
                .frame(width: size, height: size)
                .offset(x: xOffset)
                .onTapGesture {
                    isOn.toggle()
                    withAnimation(.easeInOut(duration: 0.5)) {
                        xOffset = isOn ? -offset : offset
                    }
                }
                .zIndex(1)
        }
        .onAppear {
            xOffset = offset
        }
    }
}

#Preview {
    Toggle()
}
