//
//  UIButton.swift
//  iits
//
//  Created by Mikayla Kim on 21/02/24.
//

import SwiftUI

// swiftlint:disable trailing_whitespace

struct UIButton: View {

    @Binding
    var isShown: Bool

    var label: String = "Button"
    var icon: String = "circle"
    var iconActive: String = "circle.fill"
    var colorActive: Color = .primary

    @State
    private var isActive: Bool = false

    var body: some View {
        Button {
            self.isActive.toggle()
        } label: {
            HStack {
                Image(systemName: "circle")
                    .foregroundStyle(.clear)
            }
            .padding()
            .overlay {
                Label(label, systemImage: self.isActive
                        ? iconActive
                        : icon
                )
                .labelStyle(.iconOnly)
            }
            .foregroundStyle(self.isActive
                                ? colorActive
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
            .contentShape(RoundedRectangle(cornerRadius: 8))
            .clipShape(RoundedRectangle(cornerRadius: 8))

        }
        .opacity(self.isShown ? 1 : 0)
        .buttonStyle(.plain)
    }
}

#Preview {
    UIButton(
        isShown: .constant(false)
    )
}
