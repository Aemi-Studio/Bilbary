//
//  BReadSize.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import SwiftUI

struct BReadSize: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: BSizePreferenceKey.self, value: proxy.size)
                }
            }
    }
}

struct BSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {

    func readSize(_ onChange: @escaping (CGSize) -> Void) -> some View {
        modifier(BReadSize())
            .onPreferenceChange(BSizePreferenceKey.self, perform: onChange)
    }

}
