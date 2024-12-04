//
//  HexColor.swift
//  Sage
//
//  Created by Gabriel Celis on 10/7/24.
//

import SwiftUI

struct Palette {
    private static let palette: [String] = [
        "#f4a1c3",
        "#dfeeb0",
        "#c0f0a0",
        "#d5e0e0",
        "#b4f3e0",
        "#baa69b",
        "#ebeac7",
        "#fba4ef",
        "#c9a0d6",
        "#aabfd3",
        "#99d8ed",
        "#d9e2d0",
        "#9aa8b0",
        "#9bf1e2",
        "#dbc2df",
        "#a4e3f1",
        "#bcbae6",
        "#d2e797",
        "#e9f2db",
        "#cfaec7",
    ]

    private init() {}

    static func randomColor() -> String {
        return palette.randomElement()!
    }

    static func fromString(_ string: String) -> String {
        let index = abs(string.hash) % palette.count
        return palette[index]
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(
            in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r: UInt64
        let g: UInt64
        let b: UInt64
        let a: UInt64

        switch hex.count {
        case 3:  // RGB (12-bit)
            (r, g, b, a) = (
                (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17, 255
            )
        case 6:  // RGB (24-bit)
            (r, g, b, a) = (int >> 16, int >> 8 & 0xFF, int & 0xFF, 255)
        case 8:  // ARGB (32-bit)
            (r, g, b, a) = (
                int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF, int >> 24
            )
        default:
            (r, g, b, a) = (1, 1, 1, 1)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
