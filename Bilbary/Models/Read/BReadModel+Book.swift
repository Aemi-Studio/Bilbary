//
//  ReadModel+Book.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import Foundation
import OSLog
import SwiftData

extension BReadModel {

    public func shiftBook() {
        var books = self.selectedBooks.dropFirst(1)
        books.append(Self.cachedBooks.randomElement()!)
        self.selectedBooks = .init(books)
    }

    public func addBook(drop: Bool = false) {
        var books = self.selectedBooks
        books.append(Self.cachedBooks.randomElement()!)
        self.selectedBooks = .init(books)
    }

    @discardableResult
    public func create(for book: Book? = nil) -> BookProgress? {
        if let book = book {
            book.readingSessions.append(BookProgress(
                for: book,
                startedAt: .now,
                from: book.readingProgress
            ))
        } else {
            if let book = self.selectedBook {
                book.readingSessions.append(BookProgress(
                    for: book,
                    startedAt: .now,
                    from: book.readingProgress
                ))
            } else {
                Logger.book.info("Current book was not able to be retrieved.")
            }
        }
        return self.currentSession
    }

    public func start(at startDate: Date) {
        if let book = self.selectedBook {
            self.currentSession?.start(
                at: .now,
                from: book.readingProgress
            )
        } else {
            Logger.book.info("Current book was not able to be retrieved.")
        }
    }

    public func update() {
        if let book = self.selectedBook {
            self.currentSession?.update(
                to: book,
                at: .now,
                from: book.readingProgress
            )
        } else {
            Logger.book.info("Current book was not able to be retrieved.")
        }
    }

    @discardableResult
    public func save(
        into context: ModelContext,
        oldBook: Book? = nil
    ) -> Bool {
        if let book = oldBook {
            if var session = self.currentSession {
                if session.save(
                    upTo: book.readingProgress,
                    into: context
                ) {
                    return true
                }
            }
        } else {
            if let book = self.selectedBook,
               var session = self.currentSession {
                if session.save(
                    upTo: book.readingProgress,
                    into: context
                ) {
                    return true
                }
            }
        }
        return false
    }

    @discardableResult
    public func refresh(
        into context: ModelContext,
        oldBook: Book? = nil,
        newBook: Book? = nil
    ) -> Bool {
        return if self.save(into: context, oldBook: oldBook) {
            self.create(for: newBook) != nil
        } else {
            false
        }
    }
}
