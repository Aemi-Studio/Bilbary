//
//  SheetPosition.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 02/08/24.
//

import SwiftUI

// Custom View Extension which will return View Position

struct PositionKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
extension View {
    @ViewBuilder
    func viewPosition( completion: @escaping (CGFloat) -> Void) -> some View {
        self
            .overlay {
                GeometryReader {
                    let y = $0.frame(in: .global).minY

                    Color.clear
                        .preference(key: PositionKey.self, value: y)
                        .onPreferenceChange(PositionKey.self, perform: completion)
                }
            }
    }
}
