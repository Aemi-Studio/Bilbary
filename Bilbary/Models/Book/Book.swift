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

struct Book: Identifiable {

    private let parser: EPUBParser
    private let document: EPUBDocument

    public let id: UUID = .init()
    public let url: URL
    public let cover: BookCover?
    public let content: BookContent?

    public var title: String? {
        self.metadata.title
    }
    public var author: String? {
        self.metadata.creator?.name
    }
    public var publisher: String? {
        self.document.publisher
    }
    public var metadata: EPUBMetadata {
        self.document.metadata
    }

    init?(from url: URL?) {

        guard let url = url else {
            Logger.book.warning("<\(String(describing: url))> is nil")
            return nil
        }

        self.url = url

        self.parser = .init()
        self.parser.delegate = Self.delegate

        do {
            self.document = try self.parser.parse(documentAt: url)
        } catch {
            Logger.book.warning("EPUB could not be created for <\(String(describing: url))>")
            return nil
        }

        self.cover = BookCover(url: document.cover)
        self.content = BookContent(from: document.content)
    }
}
