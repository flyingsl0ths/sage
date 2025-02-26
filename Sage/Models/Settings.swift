//
//  Settings.swift
//  Sage
//
//  Created by Gabriel Celis on 1/21/25.
//
import SwiftUI

enum Mode: Int {
    case light
    case dark
}

struct Settings {
    var mode: Mode = .light
    var marqueeAnimation: Bool = false
    var accentColor = Color.accentColor
}
