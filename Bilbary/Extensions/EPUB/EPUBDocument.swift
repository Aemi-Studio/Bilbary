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

    public var contentDirectoryFiles: [URL]? {

        let url = self.contentDirectory
        var list: [URL] = []

        guard let bookBundle = Bundle(path: url.path()) else {
            Logger.epub.error("EPUB bundle at <path:\(url.path())> unresolved.")
            return nil
        }

        for ext in ["xhtml", "xhtm", "htm", "html"] {
            if let urls = bookBundle.urls(
                forResourcesWithExtension: ".\(ext)",
                subdirectory: nil
            ) {
                list.append(contentsOf: urls)
            }
        }

        return list.compactMap { $0.absoluteURL }
    }

    public var spineFiles: [URL]? {

        guard let files = self.contentDirectoryFiles else {
            Logger.epub.warning("<\(self.contentDirectory)> Not able to be explored.")
            return nil
        }

        return self.spine.items.compactMap { item in
            files.first(where: { url in
                do {
                    return !(
                        url
                            .path()
                            .matches(
                                of: try Regex(".*(?<file>\(item.idref)\\.(?:x?html?))$")
                            )
                            .isEmpty
                    )
                } catch {
                    return false
                }
            })
        }
    }

    public var content: [String]? {
        guard let files = self.spineFiles else {
            Logger.epub.warning("<\(self.contentDirectory)> Mapping with spine not possible.")
            return nil
        }

        return files.flatMap { url in
            do {
                return try SwiftSoup
                    .parse(String(contentsOf: url, encoding: .utf8))
                    .select("p,h1,h2,h3,h4,h5,h6,pre")
                    .compactMap { try $0.text() }
            } catch {
                Logger.epub.error("XML File not loaded")
            }
            return []
        }
    }

}
