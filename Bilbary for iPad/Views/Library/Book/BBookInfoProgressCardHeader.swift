//
//  BBookInfoProgressCardHeader.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoProgressCardHeader: View {

    var book: Book

    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                BBookProgressCircle(book: book)
            }
            .cardHeaderImageStyle()

            VStack(alignment: .leading) {

                if book.readingTime == 0.0 {
                    Text(
                        NSLocalizedString(
                            "book.readingDurationZero",
                            comment: "Text that replaces book reading duration when zero"
                        )
                    )
                    .font(.title2)
                    .fontWeight(.bold)
                } else {
                    Text(Duration.seconds(book.readingTime).formatted(.time(pattern: .hourMinute)))
                        .font(.title2)
                        .fontWeight(.bold)
                }

                VStack {
                    if book.readingStartDate == nil {
                        Text(
                            NSLocalizedString(
                                "book.notStartedYet",
                                comment: "Text that replaces the book reading duration if book hasn't been started yet."
                            )
                        )
                    } else {
                        HStack {
                            Text(
                                NSLocalizedString(
                                    "book.readStartDate",
                                    comment: "Prefix text to read start date"
                                )
                            )
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.userDefinedForeground.secondary)

                            Text(Book.format(book.readingStartDate!))
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                        HStack {
                            Text(
                                NSLocalizedString(
                                    "book.readEndDate",
                                    comment: "Prefix text to read end date"
                                )
                            )
                            Text(Book.format(book.readingEndDate!))
                                .font(.headline)
                                .fontWeight(.medium)
                        }
                    }
                }
            }

            Spacer()
        }
    }
}
