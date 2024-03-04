//
//  BookInfoProgressCard.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoProgressCard: View {
    var book: Book
    var body: some View {
        VStack {
            BBookInfoProgressCardHeader(book: book)
        }
        .cardStyle()
    }
}
