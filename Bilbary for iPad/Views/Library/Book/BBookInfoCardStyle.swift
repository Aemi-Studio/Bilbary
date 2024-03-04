//
//  BBookInfoCardStyle.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 12))
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(BBookInfoCardStyle())
    }
}
