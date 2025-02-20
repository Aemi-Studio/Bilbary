//
//  EPUBScrollableContent.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import SwiftUI
import OSLog

struct EPUBScrollableContent: View {

    @State private var view: BViewModel = .shared
    @State private var cust: RCustomizerModel = .shared
    @State private var data: DataModel = .shared
    @State private var read: BReadModel = .shared

    var book: Book

    private var session: BookSession? {
        read.currentSession
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                if read.selectedBook != nil {
                    ScrollView(.vertical) {
                        LazyVStack(alignment: .leading, spacing: cust.paragraphSpacing) {
                            ForEach(book.content.formatted, id: \.id) { paragraph in
                                HStack {
                                    Text(
                                        cust.style.present(
                                            paragraph.content
                                        )
                                    )
                                    .lineSpacing( cust.lineHeight )
                                    .multilineTextAlignment(.leading)

                                    Spacer()
                                }
                                .padding(.horizontal, 80)
                                .frame(width: view.screenWidth)
                                .scrollTransition(axis: .vertical, transition: {
                                    $0
                                        .blur(radius: $1.isIdentity ? 0 : 10)
                                        .opacity( $1.isIdentity ? 1 : 0.5 )
                                })
                                .tag(paragraph.id)
                                .id(paragraph.id)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .overlay {
                        ZStack {
                            VStack {
                                LinearGradient(colors: [
                                    Color.userDefinedBackground,
                                    Color.clear,
                                    Color.clear,
                                    Color.clear
                                ], startPoint: .top, endPoint: .center)
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)

                            VStack {
                                Spacer()
                                LinearGradient(colors: [
                                    Color.userDefinedBackground,
                                    Color.clear,
                                    Color.clear
                                ], startPoint: .bottom, endPoint: .center)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .allowsHitTesting(false)
                    }
                    .defaultScrollAnchor(.top)
                    .scrollPosition(id: $read.currentParagraphId, anchor: .center)
                    .scrollIndicators(.never)
                    .frame(minHeight: 200)
                    .padding(0)
                    .padding(.vertical)
                } else {
                    Spacer()
                    EmptyView()
                    Spacer()
                }
            }
            .padding(0)
        }
        .defersSystemGestures(on: .horizontal)
        .padding(.vertical, 0)
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
