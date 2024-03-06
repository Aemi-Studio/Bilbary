//
//  EPUBScrollableContent.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import SwiftUI

struct EPUBScrollableContent: View {

    @State private var view: BViewModel = .shared
    @State private var cust: RCustomizerModel = .shared
    @State private var data: DataModel = .shared
    @State private var read: BReadModel = .shared

    var book: Book

    private var session: BookProgress? {
        read.currentSession
    }

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(book.content.strings.prefix(10), id: \.self) { paragraph in
                        VStack(alignment: .leading, spacing: 0) {
                            Text(
                                cust.style.present(
                                    paragraph
                                )
                            )
                            .lineSpacing( cust.lineHeight )
                            .padding(.bottom, cust.paragraphSpacing)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                    }
                }
                .frame(minHeight: 200)
                .frame(maxWidth: .infinity)
                .padding(0)
            }
            .padding(0)
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 80)
        .frame(width: view.screenWidth)
        .onAppear {
            if let session = self.session {
                session.start(at: .now, from: book.readingProgress)
            } else {
                read.currentSession = .init(for: book, startedAt: .now)
            }
        }
        .onDisappear {
            if let session = self.session {
                if !Date.now.timeIntervalSince(session.startDate).isLess(than: 10) {
                    if let context = data.context {
                        if session.save(upTo: book.readingProgress, into: context) {
                            read.currentSession = nil
                        }
                    }
                }
            }
            if let position = read.selectedBooks.firstIndex(where: {$0.hashValue == book.hashValue}) {
                read.addBook(drop: position > 1)
            }
        }
    }
}
