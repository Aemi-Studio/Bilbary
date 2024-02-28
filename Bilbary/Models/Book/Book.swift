//
//  Book.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import Foundation
import EPUBKit
import OSLog

struct Book: Identifiable, Hashable, Equatable {

    static private let logger: Logger = .init()

    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.url == rhs.url
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.url)
    }

    let id: UUID = .init()

    var url: URL?
    var document: EPUBDocument?

    public var title: String {
        document?.title ?? ""
    }

    public var author: String {
        document?.author ?? ""
    }

    public var contentDirectory: URL? {
        document?.contentDirectory
    }

    public var content: Any? {
        document?.directory
    }

    public var spine: EPUBSpine? {
        document?.spine
    }

    public var manifest: EPUBManifest? {
        document?.manifest
    }

    public var contentFiles: [URL] {
        BookHelper.filesUrls(in: self.contentDirectory).compactMap { $0.absoluteURL }
    }

    public var contentItems: [URL] {
        let contentFiles = self.contentFiles
        return (document?.spine.items ?? []).compactMap { item in
            contentFiles.first(where: { url in
                do {
                    return !(url.path().matches(of: try Regex(".*(?<file>\(item.idref)\\.(?:html?|xhtml?))$")
                    ).isEmpty)
                } catch {
                    return false
                }
            })
        }
    }

    public var manifestItems: [EPUBManifestItem] {
        (document?.manifest.items ?? .init()).map { $0.value }
    }

    init(from url: URL?) {
        self.url = url
        if let url = url {
            self.document = BookHelper.loadDocument(from: url)
        } else {
            self.document = nil
        }
    }
}
