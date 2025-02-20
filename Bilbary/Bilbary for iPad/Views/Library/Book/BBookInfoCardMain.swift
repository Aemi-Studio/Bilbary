//
//  BBookInfoCardMain.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardMain: View {
    var book: Book
    var body: some View {
        VStack {
            BBookInfoCardMainHeader(book: book)
        }
        .cardStyle()
    }
}
