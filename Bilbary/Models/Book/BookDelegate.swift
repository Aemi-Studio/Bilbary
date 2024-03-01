//
//  Book+BookDelegate.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation
import OSLog
import EPUBKit

internal class BookDelegate: EPUBParserDelegate {

    var didBeginParsingDocumentAt: ((URL) -> Void)?
    var didUnzipArchiveTo: ((URL) -> Void)?
    var didLocateContentAt: ((URL) -> Void)?
    var didFinishParsingMetadata: ((EPUBMetadata) -> Void)?
    var didFinishParsingManifest: ((EPUBManifest) -> Void)?
    var didFinishParsingSpine: ((EPUBSpine) -> Void)?
    var didFinishParsingTableOfContents: ((EPUBTableOfContents) -> Void)?
    var didFinishParsingDocumentAt: ((URL) -> Void)?
    var didFailParsingDocument: ((Error) -> Void)?

    init(
        didBeginParsingDocumentAt: ((URL) -> Void)? = nil,
        didUnzipArchiveTo: ((URL) -> Void)? = nil,
        didLocateContentAt: ((URL) -> Void)? = nil,
        didFinishParsingMetadata: ((EPUBMetadata) -> Void)? = nil,
        didFinishParsingManifest: ((EPUBManifest) -> Void)? = nil,
        didFinishParsingSpine: ((EPUBSpine) -> Void)? = nil,
        didFinishParsingTableOfContents: ((EPUBTableOfContents) -> Void)? = nil,
        didFinishParsingDocumentAt: ((URL) -> Void)? = nil,
        didFailParsingDocument: ((Error) -> Void)? = nil
    ) {
        self.didBeginParsingDocumentAt = didBeginParsingDocumentAt
        self.didUnzipArchiveTo = didUnzipArchiveTo
        self.didLocateContentAt = didLocateContentAt
        self.didFinishParsingMetadata = didFinishParsingMetadata
        self.didFinishParsingManifest = didFinishParsingManifest
        self.didFinishParsingSpine = didFinishParsingSpine
        self.didFinishParsingTableOfContents = didFinishParsingTableOfContents
        self.didFinishParsingDocumentAt = didFinishParsingDocumentAt
        self.didFailParsingDocument = didFailParsingDocument
    }

    func parser(_ parser: EPUBParser, didBeginParsingDocumentAt path: URL) {
        didBeginParsingDocumentAt?(path)
    }

    func parser(_ parser: EPUBParser, didUnzipArchiveTo directory: URL) {
        didUnzipArchiveTo?(directory)
    }

    func parser(_ parser: EPUBParser, didLocateContentAt directory: URL) {
        didLocateContentAt?(directory)
    }

    func parser(_ parser: EPUBParser, didFinishParsing metadata: EPUBMetadata) {
        didFinishParsingMetadata?(metadata)
    }

    func parser(_ parser: EPUBParser, didFinishParsing manifest: EPUBManifest) {
        didFinishParsingManifest?(manifest)
    }

    func parser(_ parser: EPUBParser, didFinishParsing spine: EPUBSpine) {
        didFinishParsingSpine?(spine)
    }

    func parser(_ parser: EPUBParser, didFinishParsing tableOfContents: EPUBTableOfContents) {
        didFinishParsingTableOfContents?(tableOfContents)
    }

    func parser(_ parser: EPUBParser, didFinishParsingDocumentAt path: URL) {
        didFinishParsingDocumentAt?(path)
    }

    func parser(_ parser: EPUBParser, didFailParsingDocumentAt path: URL, with error: Error) {
        didFailParsingDocument?(error)
    }

}

extension BookDelegate {
    static var `default`: BookDelegate = .init(
        didBeginParsingDocumentAt: { url in
            Logger.book.info("didBeginParsingDocumentAt: <\(String(describing: url))>")
        }
    )
}
