//
//  Book.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import Foundation
import EPUBKit
import SwiftSoup
import OSLog
import Compression
import SwiftUI

@Observable
final class Book: Identifiable {
    private let document: EPUBDocument

    public let id: UUID = .init()
    public let url: URL

    public let cover: BookCover?
    public let content: BookContent?

    public var readingSessions: [BookProgress] = []

    public var readingStatus: BookReadingStatus = .undefined

    public var opinion: BookOpinion = .undefined

    init?(from url: URL?) {

        guard let url = url else {
            Logger.book.warning("<\(String(describing: url))> is nil")
            return nil
        }

        self.url = url

        do {
            Self.parser.delegate = Self.delegate
            self.document = try Self.parser.parse(documentAt: url)
        } catch {
            Logger.book.warning("EPUB could not be created for <\(String(describing: url))>")
            return nil
        }

        self.cover = BookCover(url: document.cover)
        self.content = BookContent(from: document.content)
    }
}

// MARK: Metadata
extension Book {
    public var metadata: EPUBMetadata {
        self.document.metadata
    }

    public var title: String {
        Util.unknownMetadata(self.metadata.title)
    }

    public var author: String {
        Util.unknownMetadata(self.metadata.creator?.name)
    }

    public var publisher: String {
        Util.unknownMetadata(self.document.publisher)
    }

    public var description: String {
        Util.unknownMetadata(self.metadata.description)
    }
}

// MARK: Reading Progress
extension Book {
    public var readingTime: TimeInterval {
        var total: TimeInterval = 0.0
        for session in self.readingSessions {
            total += session.duration
        }
        return total
    }

    public var readingProgress: CGFloat {
        self.readingSessions.last?.endProgress ?? 0.0
    }

    public var readingStartDate: Date? {
        self.readingSessions.first?.startDate
    }

    public var readingEndDate: Date? {
        self.readingSessions.last?.endDate
    }
}
