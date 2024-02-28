//
//  BookHelper.swift
//  Bilbary • iPad
//
//  Created by Guillaume Coquard on 28/02/24.
//

import Foundation
import EPUBKit
import OSLog
import UniformTypeIdentifiers
import AEXML

@Observable
final class BookHelper {

    private static let logger: Logger = .init()

    private static let fm: FileManager = .init()

    public static var localBooksUrls: [URL] {

        guard let booksUrls = Bundle.main.urls(
            forResourcesWithExtension: UTType.epub.preferredFilenameExtension,
            subdirectory: nil
        ) else {
            return []
        }

        return booksUrls
    }

    public static var localBooks: [Book] {
        self.localBooksUrls.compactMap(Book.init)
    }

    public static func loadDocument(from url: URL?) -> EPUBDocument? {
        if let url = url {
            return .init(url: url)
        }
        return nil
    }

    public static func filesUrls(in url: URL?) -> [URL] {
        var list: [URL] = []

        if let url = url {

            guard let bookBundle = Bundle(path: url.path()) else {
                logger.error("Book bundle unresolved.")
                return []
            }

            for ext in ["xhtml", "xhtm", "htm", "html"] {
                if let urls = bookBundle.urls(
                    forResourcesWithExtension: ".\(ext)",
                    subdirectory: nil
                ) {
                    list.append(contentsOf: urls)
                }
            }
        } else {
            logger.error("URL is undefined.")
        }

        return list
    }

    public static func content(from url: URL?) -> Data? {
        return if let url = url {
            fm.contents(atPath: url.path())
        } else {
            nil
        }
    }
}
