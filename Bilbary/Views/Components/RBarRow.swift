//
//  Views.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

struct RBarRow<L, C, T>: View where L: View, C: View, T: View {

    private var _leading: L?
    private var _center: C?
    private var _trailing: T?

    init(
        @ViewBuilder leading: @escaping () -> L,
        @ViewBuilder center: @escaping () -> C,
        @ViewBuilder trailing: @escaping () -> T
    ) {
        self._leading = leading()
        self._center = center()
        self._trailing = trailing()
    }

    private let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .leading),
        .init(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .trailing)
    ]

    var leading: some View {
        self._leading
    }

    var center: some View {
        self._center
    }

    var trailing: some View {
        self._trailing
    }

    var body: some View {
        Group {
            LazyVGrid(columns: self.columns) {
                leading
                center
                trailing
            }
        }
    }
}
