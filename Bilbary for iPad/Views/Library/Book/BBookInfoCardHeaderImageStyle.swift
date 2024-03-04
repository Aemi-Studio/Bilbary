//
//  BBookInfoCardHeaderImageStyle.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardHeaderImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.foreground)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 8))
            .shadow(radius: 10)
    }
}

extension View {

    func cardHeaderImageStyle() -> some View {
        modifier(BBookInfoCardHeaderImageStyle())
    }

}
