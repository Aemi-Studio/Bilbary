//
//  RButton.swift
//  iits
//
//  Created by Mikayla Kim on 21/02/24.
//

import SwiftUI

struct RButton<L>: RActionable, View {

    @Binding
    var isShown: Bool

    @State
    private var isActive: Bool = false

    private var _label: (any View)?

    private var _title: String?
    private var _systemImage: String?
    private var _systemImageActive: String?

    private var hasCustomLabel: Bool = false

    private var action: (() -> Void)?

    internal var isUIActive: Bool {
        self.isActive || ViewModel.shared.activePopover(is: self.type)
    }
    internal var type: ViewModel.PopoverType = .none

    init(
        isShown: Binding<Bool>,
        title: String = "Button",
        systemImage: String = "circle",
        systemImageActive: String? = "circle.fill",
        linkedTo popoverType: ViewModel.PopoverType = .none,
        action: @escaping () -> Void = {}
    ) where L == AnyView {
        self._isShown = isShown
        self.action = action
        self.hasCustomLabel = false
        self.type = popoverType
        self._title = title
        self._systemImage = systemImage
        self._systemImageActive = systemImageActive
    }

    init(
        isShown: Binding<Bool>,
        linkedTo popoverType: ViewModel.PopoverType = .none,
        action: @escaping () -> Void = {},
        @ViewBuilder label: @escaping () -> L
    ) where L == AnyView {
        self._isShown = isShown
        self.action = action
        self.hasCustomLabel = true
        self.type = popoverType
        self._label = label()
    }

    private var label: some View {
        if let _label = self._label {
            AnyView(
                _label
            )
        } else {
            AnyView(
                Label(
                    self._title ?? "Button",
                    systemImage: self.isUIActive
                        ? (self._systemImageActive ?? self._systemImage ?? "circle.fill")
                        : self._systemImage ?? "circle"
                )
            )
        }
    }

    var body: some View {
        Button {
            if isShown {
                self.action?()
            }
        } label: {
            HStack {
                if hasCustomLabel {
                    label
                } else {
                    Image(systemName: "circle")
                        .foregroundStyle(.clear)
                }
            }
            .padding()
            .overlay {
                if !hasCustomLabel {
                    self.label
                        .labelStyle(.iconOnly)
                } else {
                    EmptyView()
                }
            }
            .foregroundStyle(
                self.isUIActive
                    ? .primary
                    : .secondary
            )
            .fontWeight(.bold)
            .background {
                if self.isUIActive {
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
        .onPress {
            if (self.type != .none && !ViewModel.shared.isAnyPopoverDisplayed)
                || self.type == .none {
                self.isActive = true
            }
        }
        .onRelease {
            self.isActive = false
        }
    }
}
