//
//  RClickableModifier.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import SwiftUI

struct BClickableModifier: ViewModifier {

    var shape: (any Shape)?

    func body(content: Content) -> some View {
        Group {
            if shape != nil {
                content
                    .contentShape(AnyShape(shape!))
            } else {
                content
                    .contentShape(.rect())
            }
        }
    }
}

extension View {

    func clickable() -> some View {
        modifier(BClickableModifier())
    }

    func clickable<S: Shape>(_ shape: S) -> some View {
        modifier(BClickableModifier(shape: shape))
    }

}
