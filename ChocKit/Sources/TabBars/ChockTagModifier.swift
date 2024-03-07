//
//  VardiacApp.swift
//  ChockTag
//
//  Created by Alex Vaiman on 05/03/2024.
//

import Foundation
import SwiftUI


struct ChockTag: ViewTraitKey {
    static var defaultValue: AnyHashable? = Optional<String>.none
}

public extension View {
    func chockBarItem<Value: Hashable>(_ value: Value) -> some View {
        _trait(ChockTag.self, value)
    }
}
