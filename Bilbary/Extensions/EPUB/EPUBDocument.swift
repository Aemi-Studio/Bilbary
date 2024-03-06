//
//  EPUBDocument.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 29/02/24.
//

import Foundation
import EPUBKit
import SwiftSoup
import OSLog

extension EPUBDocument {
    private var contentFiles: [URL] {
        guard let bundle = Bundle(path: self.contentDirectory.path()) else {
            Logger.epub.error("EPUB bundle at <path:\(self.contentDirectory)> unresolved.")
            return []
        }
        var items = self.spine.items.compactMap { item in
            return if let manifestItem = self.manifest.items.first(where: { (_, value) in item.idref == value.id }) {
                bundle.bundleURL.appendingPathComponent(manifestItem.value.path)
            } else {
                nil
            }
        }
        return items
    }
    public var content: [String] {
        self.contentFiles.flatMap { url in
            do {
                return try SwiftSoup
                    .parse(String(contentsOf: url, encoding: .utf8))
                    .select("p,h1,h2,h3,h4,h5,h6,pre")
                    .compactMap { try $0.text().trimmingCharacters(in: .whitespacesAndNewlines) }
                    .filter { !$0.isEmpty }
            } catch {
                Logger.epub.error("XML File not loaded")
            }
            return []
        }
    }
}
