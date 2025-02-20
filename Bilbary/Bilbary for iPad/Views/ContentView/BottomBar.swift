//
//  BottomBar.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI
import OSLog

struct BottomBar: View {

    @State
    private var view: BViewModel = .shared

    @State
    private var readModel: BReadModel = .shared

    private var logger: Logger = .init()

    var body: some View {
        RBarRow {
            BPopover(
                isShown: $view.isInterfaceVisible,
                title: NSLocalizedString(
                    "Informations",
                    comment: "Information about the current open book"
                ),
                systemImage: "book",
                systemImageActive: "book.fill",
                type: .information

            ) {
                if let book = readModel.selectedBook {
                    BBookInformationPopover(book: book)
                } else {
                    EmptyView()
                }
            }
        } center: {
            RButton(
                isShown: .constant(true)
            ) {
                readModel.selectedBook?.opinion.toggle()
            } label: {
                AnyView(
                    Label(
                        NSLocalizedString("Like", comment: "Action of liking, in the context of the current book"),
                        systemImage: readModel.selectedBook?.opinion == .liked ? "heart.fill" : "heart"
                    )
                    .labelStyle(.iconOnly)
                )
            }
        } trailing: {
            BPopover(
                isShown: $view.isInterfaceVisible,
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
