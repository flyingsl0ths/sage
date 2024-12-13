//
//  Nums.swift
//  Sage
//
//  Created by Gabriel Celis on 12/13/24.
//
import SwiftUI

extension Float {
    func toCGSize() -> CGSize {
        let size = CGFloat(self)
        return CGSize(width: size, height: size)
    }
}

extension Double {
    func toCGSize() -> CGSize {
        let size = CGFloat(self)
        return CGSize(width: size, height: size)
    }
}
