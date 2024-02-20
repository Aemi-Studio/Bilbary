//
//  ButtonPopOver.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

struct PopOver<Label: View, Popover: View>: View {

    @State
    private var isPresented: Bool = false

    var title: String?
    var systemImage: String?

    var label: (() -> Label)?
    var popover: (() -> Popover)?

    var anchor: PopoverAttachmentAnchor = .point(.bottom)
    var arrowEdge: Edge = .bottom

    init(
        _ title: String,
        _ systemImage: String,
        anchor: PopoverAttachmentAnchor = .point(.bottom),
        arrowEdge: Edge = .bottom,
        @ViewBuilder popover: @escaping () -> Popover
    ) {
        self.title = title
        self.systemImage = systemImage
        self.anchor = anchor
        self.arrowEdge = arrowEdge
        self.popover = popover
    }

    init(
        anchor: PopoverAttachmentAnchor = .point(.bottom),
        arrowEdge: Edge = .bottom,
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder popover: @escaping () -> Popover
    ) {
        self.anchor = anchor
        self.arrowEdge = arrowEdge
        self.label = label
        self.popover = popover
    }

    var body: some View {
        if let title = title, let systemImage = systemImage {
            Button(title, systemImage: systemImage) {
                isPresented.toggle()
            }
            .popover(
                isPresented: $isPresented,
                attachmentAnchor: self.anchor,
                arrowEdge: self.arrowEdge
            ) {
                self.popover!()
            }
        } else {
            Button {
                isPresented.toggle()
            } label: {
                self.label!()
            }
            .popover(
                isPresented: $isPresented,
                attachmentAnchor: self.anchor,
                arrowEdge: self.arrowEdge
            ) {
                self.popover!()
            }
        }
    }
}
