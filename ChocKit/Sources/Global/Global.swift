//
//  File.swift
//  ChocKit
//
//  Created by Alex Vaiman on 02/03/2024.
//

import SwiftUI

public struct ChockShadow {
    let radius: CGFloat
    let color: Color
    let x: CGFloat
    let y: CGFloat
    let opacity: Double
    public static let defaultShadowColor = Color(.sRGBLinear, white: 0, opacity: 0.33)
   
    
    public init(radius: CGFloat, color: Color = Self.defaultShadowColor, x: CGFloat = 0, y: CGFloat = 0, opacity: Double = 1) {
        self.radius = radius
        self.color = color
        self.x = x
        self.y = y
        self.opacity = opacity
    }
}
