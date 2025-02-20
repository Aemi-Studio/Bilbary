//
//  BBookInformationPopover.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import SwiftUI

struct BBookInformationPopover: View {

    var book: Book

    var body: some View {
        VStack(spacing: 16) {
            BBookInfoCardMain(book: book)
            BBookInfoProgressCard(book: book)
        }
        .padding()
    }
}
