//
//  BottomBar.swift
//  Read for iPad & macOS
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI
import OSLog

struct BottomBar: View {

    @State
    private var view: ViewModel = .shared

    private var logger: Logger = .init()

    var body: some View {
        RBarRow {
            RPopover(
                isShown: $view.interfaceVisibility,
                title: NSLocalizedString(
                    "Informations",
                    comment: "Information about the current open book"
                ),
                systemImage: "book",
                systemImageActive: "book.fill",
                type: .information

            ) {
                HStack {}.frame(width: 200, height: 100)
            }
        } center: {
            RButton(
                isShown: .constant(true),
                title: NSLocalizedString("Like", comment: "Action of liking, in the context of the current book"),
                systemImage: "heart",
                systemImageActive: "heart.fill"
            ) {
                logger.log("I like that.")
            }
        } trailing: {
            RPopover(
                isShown: $view.interfaceVisibility,
                title: NSLocalizedString("Text Customization", comment: ""),
                systemImage: "textformat.size",
                type: .customization
            ) {
                CustomizerView()
            }
        }
    }
}

#Preview {
    BottomBar()
}
