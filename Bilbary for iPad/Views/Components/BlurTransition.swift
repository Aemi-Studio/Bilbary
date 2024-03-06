//
//  BlurTransition.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import SwiftUI

struct BlurTransition: ViewModifier {
    let blurValue: CGFloat

    func body(content: Content) -> some View {
        content
            .blur(radius: blurValue)
    }
}

extension AnyTransition {
    static var blur: AnyTransition {
        .modifier(
            active: BlurTransition(blurValue: 20),
            identity: BlurTransition(blurValue: 0)
        )
    }
}
