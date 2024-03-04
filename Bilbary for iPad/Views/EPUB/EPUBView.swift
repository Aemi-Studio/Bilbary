//
//  MainView.swift
//  iits
//
//  Created by Guillaume Coquard on 21/02/24.
//

import SwiftUI
import EPUBKit
import OSLog
import AEXML
import SwiftSoup

struct EPUBView: View {

    private let logger: Logger = .init()

    @State
    private var chapterText: String?

    @State
    private var isLoading: Bool = false

    @State
    private var isImporting: Bool = false

    private var books: [Book] {
        Book.localBooks
    }

    private var firstBook: Book {
        self.books.first!
    }

    var body: some View {
        VStack {
            Spacer()
            EPUBSwipeView()
            Spacer()
        }
        .frame(minHeight: 200)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .padding(.horizontal, 0)
    }
}
