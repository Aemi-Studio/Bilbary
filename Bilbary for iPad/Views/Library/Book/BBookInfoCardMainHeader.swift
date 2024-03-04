//
//  BBookInfoCardMainHeader.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardMainHeader: View {

    var book: Book

    var body: some View {
        HStack(spacing: 16) {

            ZStack {
                if book.cover != nil {
                    book.cover!.asyncImage
                } else {
                    EmptyView()
                }
            }
            .bookCoverStyle()

            BBookInfoCardHeaderText(
                title: book.title
            )

            Spacer()
        }
    }
}
