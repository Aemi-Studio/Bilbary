//
//  BBookProgressCover.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import SwiftUI

struct BBookProgressCover: View {

    var book: Book

    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Group {
                        if let cover = self.book.cover {
                            ZStack {
                                cover.asyncImage
                                Rectangle()
                                    .foregroundStyle(.ultraThinMaterial)
                            }
                        } else {
                            Rectangle()
                                .foregroundStyle(.ultraThinMaterial)
                        }
                    }
                    .overlay(.black.opacity(0.1))
                    .bookCoverStyle()
                }
                BBookProgressCircle(book: self.book)
            }
            Group {
                if self.book.readingStatus == .started {
                    Text(
                        self.book.readingProgress,
                        format: .number.rounded(
                            rule: .toNearestOrEven
                        )
                    )
                    .monospacedDigit()
                    .fontWeight(.medium)
                } else {
                    Label(
                        NSLocalizedString(
                            "Not started yet",
                            comment: "Accessibility label for the closed book icon when a book is not started yet"
                        ),
                        systemImage: "book.closed.fill"
                    )
                    .labelStyle(.iconOnly)
                    .font(.caption)
                    .opacity(0.6)
                }
            }
        }
    }
}
