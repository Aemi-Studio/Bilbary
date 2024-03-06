//
//  BPopover.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI
import OSLog

struct BPopover<L, P>: RActionable, View {

    private let logger: Logger = .init()

    @Binding
    var isShown: Bool

    @State
    private var isPresented: Bool = false

    @State
    private var view: BViewModel = .shared

    private var hasCustomLabel: Bool = false

    private var _label: (any View)?
    private var _popover: (any View)?

    private var _title: String?
    private var _systemImage: String?
    private var _systemImageActive: String?

    private var anchor: PopoverAttachmentAnchor = .point(.bottom)
    private var arrowEdge: Edge = .bottom

    internal let type: BViewModel.PopoverType
    internal var isUIActive: Bool {
        self.isPresented || BViewModel.shared.activePopover(is: self.type)
    }

    init(
        isShown: Binding<Bool>,
        title: String,
        systemImage: String,
        systemImageActive: String? = nil,
        anchor: PopoverAttachmentAnchor = .point(.bottom),
        arrowEdge: Edge = .bottom,
        type: BViewModel.PopoverType,
        @ViewBuilder popover: @escaping () -> P
    ) where L == any View, P == any View {
        self._isShown = isShown
        self.hasCustomLabel = false
        self.anchor = anchor
        self.arrowEdge = arrowEdge
        self.type = type
        self._title = title
        self._systemImage = systemImage
        self._systemImageActive = systemImageActive
        self._popover = popover()
    }

    init(
        isShown: Binding<Bool>,
        anchor: PopoverAttachmentAnchor = .point(.bottom),
        arrowEdge: Edge = .bottom,
        type: BViewModel.PopoverType,
        @ViewBuilder label: @escaping () -> L,
        @ViewBuilder popover: @escaping () -> P
    ) where L == any View, P == any View {
        self._isShown = isShown
        self.hasCustomLabel = true
        self.anchor = anchor
        self.arrowEdge = arrowEdge
        self.type = type
        self._label = label()
        self._popover = popover()
    }

    internal func defaultAction() {
        switch view.isTogglable(self.type) {
        case 0:
            self.isPresented.toggle()
            view.updatePopover(to: self.type)
        case 1:
            self.isPresented.toggle()
        default:
            view.updatePopover(to: .none)
        }
    }

    private var label: some View {
        if let _label = self._label {
            AnyView(
                RButton(
                    isShown: $isShown,
                    linkedTo: self.type
                ) {
                    self.defaultAction()
                } label: {
                    AnyView( _label )
                }
            )
        } else {
            AnyView(
                RButton(
                    isShown: $isShown,
                    title: self._title ?? "Button",
                    systemImage: self._systemImage ?? "circle",
                    systemImageActive: self._systemImageActive
                        ?? self._systemImage
                        ?? "circle.fill",
                    linkedTo: self.type
                ) {
                    self.defaultAction()
                }
            )
        }
    }

    private var popover: some View {
        if let _popover = self._popover {
            AnyView( _popover )
        } else {
            AnyView( EmptyView() )
        }
    }

    var body: some View {
        AnyView(
            self.label
                .popover(
                    isPresented: $isPresented,
                    attachmentAnchor: self.anchor,
                    arrowEdge: self.arrowEdge
                ) {
                    self.popover
                        .onAppear {
                            view.updatePopover(to: self.type)
                        }
                        .onDisappear {
                            view.updatePopover(to: .none)
                        }
                }
        )
        .disabled(!view.isInterfaceVisible)
        .background(Color.userDefinedBackground)
        .foregroundStyle(Color.userDefinedForeground)
    }
}
