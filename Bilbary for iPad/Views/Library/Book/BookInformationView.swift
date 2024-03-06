//
//  BookInformationView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

// swiftlint:disable line_length
struct BookInformationView: View {

    @Environment(\.dismiss)
    private var dismiss: DismissAction

    @State
    private var view: BViewModel = .shared

    @State
    private var customizer: RCustomizerModel = .shared

    @State
    private var size: CGFloat?

    var book: Book

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                BBookInfoCardMain(book: book)
                BBookInfoProgressCard(book: book)
                BBookInfoCard(
                    title: book.author,
                    subtitle: "Author",
                    systemImage: "person.fill"
                )
                BBookInfoCard(
                    title: "Description",
                    content: book.description
                )
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .frame(minWidth: BConstants.libraryOpenWidth)
        .frame(maxWidth: BConstants.libraryOpenWidth)
        .fixedSize(horizontal: true, vertical: false)
        .background(Color.userDefinedBackground)
        .foregroundStyle(Color.userDefinedForeground)
        .navigationTitle(
            NSLocalizedString(
                "library.book.information.view",
                comment: "Library pane title when looking at a specific book information"
            )
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Button {book.opinion.toggle()} label: {Label("Like", systemImage: book.opinion.icon)}
            }

        }
    }
}
// swiftlint:enable line_length
