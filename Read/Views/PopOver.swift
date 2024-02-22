//
//  ButtonPopOver.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

struct PopOver<L: View, P: View>: View {

    @Binding
    var isShown: Bool

    @State
    private var isPresented: Bool = false

    var title: String?
    var systemImage: String?

    var label: (() -> L)?
    var popover: (() -> P)?

    var anchor: PopoverAttachmentAnchor = .point(.bottom)
    var arrowEdge: Edge = .bottom

    init(
        isShown: Binding<Bool>,
        _ title: String,
        systemImage: String,
        anchor: PopoverAttachmentAnchor = .point(.bottom),
        arrowEdge: Edge = .bottom,
        @ViewBuilder popover: @escaping () -> P
    ) {
        self._isShown = isShown
        self.title = title
        self.systemImage = systemImage
        self.anchor = anchor
        self.arrowEdge = arrowEdge
        self.popover = popover
    }

    init(
        isShown: Binding<Bool>,
        anchor: PopoverAttachmentAnchor = .point(.bottom),
        arrowEdge: Edge = .bottom,
        @ViewBuilder label: @escaping () -> L,
        @ViewBuilder popover: @escaping () -> P
    ) {
        self._isShown = isShown
        self.anchor = anchor
        self.arrowEdge = arrowEdge
        self.label = label
        self.popover = popover
    }

    var body: some View {
        if let title = title, let systemImage = systemImage {
            UIButton(isShown: self.$isShown, title, systemImage: systemImage) {
                isPresented.toggle()
            }
            .popover(
                isPresented: $isPresented,
                attachmentAnchor: self.anchor,
                arrowEdge: self.arrowEdge
            ) {
                self.popover?()
            }
        } else {
            UIButton(isShown: self.$isShown) {
                isPresented.toggle()
            } label: {
                self.label?()
            }
            .popover(
                isPresented: $isPresented,
                attachmentAnchor: self.anchor,
                arrowEdge: self.arrowEdge
            ) {
                self.popover?()
            }
        }
    }
}
