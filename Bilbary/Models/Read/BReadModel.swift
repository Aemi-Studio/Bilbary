//
//  ReadTimeModel.swift
//  Bilbary for iPad
//
//  Created by Guillaume Coquard on 04/03/24.
//

import Foundation
import Combine
import SwiftData
import OSLog

@Observable
final class BReadModel {
    public static let shared: BReadModel = .init()

    public static let timerIncrement: TimeInterval = 1
    public static let timer: Publishers.Autoconnect = Timer.publish(
        every: BReadModel.timerIncrement,
        on: .main,
        in: .common
    ).autoconnect()
    public static let cachedBooks: [URL] = Book.randomBooksURL(30)

    private let storage: BRMStorage = .init()

    internal var currentSession: BookSession?

    public var sessions: [BookSession]?
    public var contentLength: ReadTime.ID = ReadTime.aMin.id {
        didSet {
            self.storage.brmContentLength = self.contentLength
        }
    }
    public var selectedBooks: [Book] = Book.books(from: BReadModel.cachedBooks)
    public var selectedBook: Book?
    public var selectedBookHashValue: Int? {
        get {
            self.selectedBook?.hashValue
        }
        set {
            let book = self.selectedBook
            if newValue != book?.hashValue {
                self.selectedBook = self.selectedBooks.first(where: { $0.hashValue == newValue })
            }
        }
    }
    public var currentParagraphId: Int? {
        get {
            self.selectedBook?.currentParagraph
        }
        set {
            self.selectedBook?.currentParagraph = newValue
        }
    }

    private init() {
        self.selectedBook = self.selectedBooks.first
        if self.selectedBook != nil {
            self.currentSession = BookSession(for: self.selectedBook!, startedAt: .now)
        }
        self.contentLength = self.storage.brmContentLength
    }
}
