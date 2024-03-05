//
//  ReadTimeModel.swift
//  Bilbary for iPad
//
//  Created by Guillaume Coquard on 04/03/24.
//

import Foundation
import Combine
import SwiftData

@Observable
final class BReadModel {
    public static let shared: BReadModel = .init()
    public static let timerIncrement: TimeInterval = 1
    public static let timer: Publishers.Autoconnect = Timer.publish(
        every: BReadModel.timerIncrement,
        on: .main,
        in: .common
    ).autoconnect()
    public static let cachedBooks: [Book] = Book.localBooks
    internal var currentSession: BookProgress? {
        self.selectedBook?.readingSessions.last
    }
    public var sessions: [BookProgress]?
    public var contentLength: ReadTime = .aMin
    public var selectedBooks: [Book] = BReadModel.cachedBooks
    public var selectedBook: Book? = BReadModel.cachedBooks.first
    public var selectedBookID: UUID? {
        get {
            self.selectedBook?.id
        }
        set {
            if let old = self.selectedBooks.firstIndex(where: {$0.id == self.selectedBookID}),
               let new = self.selectedBooks.firstIndex(where: {$0.id == newValue}) {
                if old < new {
                    self.addBook(drop: new > 1)
                }
            }
            let book = self.selectedBook
            self.selectedBook = Self.cachedBooks.first(where: { $0.id == newValue })
            if DataModel.context != nil {
                self.refresh(
                    into: DataModel.context!,
                    oldBook: book,
                    newBook: self.selectedBook
                )
            }
        }
    }
    private init() {}
}
