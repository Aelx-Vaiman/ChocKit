//
//  View.swift
//  ChocKit
//
//  Created by Alex Vaiman on 06/03/2024.
//
import SwiftUI

typealias ViewTraitKey = _ViewTraitKey
typealias VariadicView = _VariadicView


struct Helper<Result: View>: VariadicView.MultiViewRoot {
    var _body: (VariadicView.Children) -> Result

    func body(children: VariadicView.Children) -> some View {
        _body(children)
    }
}

extension View {
    func variadic<R: View>(@ViewBuilder process: @escaping (VariadicView.Children) -> R) -> some View {
        VariadicView.Tree(Helper(_body: process), content: { self })
    }
}
