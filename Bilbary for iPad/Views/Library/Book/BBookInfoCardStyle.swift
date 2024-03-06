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
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black.opacity(0.1), lineWidth: 0.1)
                    .foregroundStyle(.clear)
            }
            .shadow(color: Color.black.opacity(0.2), radius: 12, y: 4)
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(BBookInfoCardStyle())
    }
}
