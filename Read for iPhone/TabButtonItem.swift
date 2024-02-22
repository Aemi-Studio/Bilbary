//
//  TabButtonItem.swift
//  Read for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct TabButtonItem: View {

    @Environment(\.accessibilityEnabled)
    private var accessibilityEnabled: Bool

    var title: String = "Label"
    var systemImage: String = "circle.dotted"
    var action: (() -> Void)?

    var body: some View {
        Button {
            action?()
        } label: {
            VStack(spacing: 8) {

                HStack {
                    Image(systemName: "circle")
                        .foregroundStyle(.clear)
                        .font(.title3)
                        .fontWeight(.medium)
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                .overlay {
                    Image(systemName: systemImage)
                        .font(.title3)
                        .fontWeight(.medium)
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }

                Label(title, systemImage: systemImage)
                    .labelStyle(.iconOnly)
                    .hidden()

                if accessibilityEnabled {
                    Text(title)
                        .font(.caption)
                        .accessibilityHidden(true)
                }
            }
            .font(.title3)
            .fontWeight(.medium)
        }
        .buttonStyle(.plain)
        .scaledToFill()
    }
}

#Preview {
    TabButtonItem()
}
