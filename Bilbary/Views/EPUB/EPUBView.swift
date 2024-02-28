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
        BookHelper.localBooks
    }

    private var firstBook: Book {
        self.books.first!
    }

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                VStack(spacing: 24) {
                    ForEach(books) { book in
                        VStack(spacing: 2) {
                            HStack {
                                Text("Directory: ")
                                Spacer()
                                Text(book.document?.directory.absoluteString ?? "undefined")
                            }
                            HStack {
                                Text("Content Directory: ")
                                Spacer()
                                Text(book.document?.contentDirectory.absoluteString ?? "undefined")
                            }
                            HStack {
                                Text("Spine: ")
                                Spacer()
                                VStack {
                                    ForEach(book.document?.spine.items ?? [], id: \.idref) { item in
                                        Text(String(describing: item))
                                    }
                                }
                            }
                            HStack {
                                Text("Files: ")
                                Spacer()
                                Text(book.contentItems.description)
                            }
                        }
                        .font(.caption)
                        .padding()
                        .background(.tertiary)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .frame(minHeight: 200)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .onAppear {
                firstBook.contentItems.forEach { url in
                    if let data = BookHelper.content(from: url) {
                        do {
                            let xml: Document = try SwiftSoup.parse(String(contentsOf: url, encoding: .utf8))
                            var contents: [String] = []

                            for item in try xml.select("p") {
                                contents.append(try item.text())
                            }

                            let size = contents.reduce(0, { curr, next in
                                curr + next.lengthOfBytes(using: .utf8)
                            })

                            self.logger.info("\(String(reflecting: size))")
                        } catch {
                            self.logger.error("XML File not loaded")
                        }

                    }
                }
            }
        }

    }
}
