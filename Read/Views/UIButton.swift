//
//  UIButton.swift
//  iits
//
//  Created by Mikayla Kim on 21/02/24.
//

import SwiftUI

struct UIButton<L: View>: View {

    @Binding
    var isShown: Bool

    private var title: String?
    private var systemImage: String = "circle"
    private var systemImageActive: String = "circle.fill"

    private var action: (() -> Void)?

    private var label: (() -> L)?

    @State
    private var isActive: Bool = false

    init(
        isShown: Binding<Bool>,
        _ title: String = "Button",
        systemImage: String = "circle",
        systemImageActive: String = "circle.fill",
        action: @escaping () -> Void = {}
    ) where L == EmptyView {
        self._isShown = isShown
        self.title = title
        self.systemImage = systemImage
        self.systemImageActive = systemImageActive
        self.action = action
    }

    init(
        isShown: Binding<Bool>,
        action: @escaping () -> Void = {},
        @ViewBuilder label: @escaping () -> L
    ) {
        self._isShown = isShown
        self.label = label
        self.action = action
    }

    var body: some View {
        Button {
            self.isActive.toggle()
            self.action?()
        } label: {

            HStack {
                if title == nil, let label = self.label {
                    label()
                } else {
                    Image(systemName: "circle")
                        .foregroundStyle(.clear)
                }
            }
            .padding()
            .overlay {
                if let title = self.title {
                    Label(
                        title,
                        systemImage: self.isActive
                            ? systemImageActive
                            : systemImage
                    )
                    .labelStyle(.iconOnly)
                } else {
                    EmptyView()
                }
            }
            .foregroundStyle(
                self.isActive
                    ? .primary
                    : .secondary
            )
            .fontWeight(.bold)
            .background {
                if isActive {
                    Rectangle()
                        .foregroundStyle(.quaternary.opacity(0.5))
                        .background(.regularMaterial)
                } else {
                    Rectangle()
                        .foregroundStyle(.clear)

                }
            }
            .contentShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )

        }
        .opacity(self.isShown ? 1 : 0)
        .buttonStyle(.plain)
    }
}
