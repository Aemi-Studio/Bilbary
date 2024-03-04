//
//  BBookCoverViewStyle.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookCoverViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(3.0/4.0, contentMode: .fit)
            .frame(width: 64)
            .clipShape(.rect(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.foreground.opacity(0.15), lineWidth: 0.5)
                    .foregroundStyle(.clear)
            }
            .shadow(color: .black.opacity(0.1), radius: 5, y: 2)
    }
}

extension View {
    func bookCoverStyle() -> some View {
        modifier(BBookCoverViewStyle())
    }
}
