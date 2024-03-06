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
import SwiftData

@Model
final class Book: Identifiable {

    public private(set) var id: UUID = UUID()

    public let url: URL

    @Transient internal var document: EPUBDocument?
    @Transient public private(set) var cover: BookCover?
    @Transient public private(set) var content: BookContent = .init()
    @Transient public var currentParagraph: Int?

    public var readingSessions: [BookSession] = []
    public var readingStatus: BookReadingStatus
    public var opinion: BookOpinion

    init?(from url: URL?, id: UUID = .init()) {
        self.id = id
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

        self.cover = BookCover(document!.cover)
        self.content = BookContent(document!.content)
        self.currentParagraph = self.content.formatted.first?.index
        self.readingStatus = BookReadingStatus.undefined
        self.opinion = BookOpinion.undefined
    }

}
