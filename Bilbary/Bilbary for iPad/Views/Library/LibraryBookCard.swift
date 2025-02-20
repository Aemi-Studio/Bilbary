//
//  libraryBookCard.swift
//  Bilbary for iPad & macOS
//
//  Created by Mikayla Kim on 22/02/24.
//

import SwiftUI

struct LibraryBookCard: View {

    var book: Book

    var body: some View {
        HStack(spacing: 16) {

            BBookProgressCover(book: book)

            VStack(alignment: .leading, spacing: 8) {
                Text(book.title)
                    .fontWeight(.bold)
                    .font(.title3)
                Text(book.author)
                    .fontWeight(.medium)
                    .font(.headline)
            }

            Spacer()

            Button {
                book.opinion.toggle()
            } label: {
                Group {
                    if book.opinion != .liked {
                        Label(
                            NSLocalizedString(
                                "Like this book",
                                comment: "Library like button"
                            ),
                            systemImage: "heart"
                        )
                    } else {
                        Label(
                            NSLocalizedString(
                                "Unlike this book",
                                comment: "Library like button is already filled"
                            ),
                            systemImage: "heart.fill"
                        )
                    }
                }
                .labelStyle(.iconOnly)
                .font(.title2)
                .fontWeight(.medium)
                .padding()
            }
            .buttonStyle(.plain)
        }
        .cardStyle()
    }
}
