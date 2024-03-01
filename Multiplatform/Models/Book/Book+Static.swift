//
//  Book+Static.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 29/02/24.
//

import Foundation


import OSLog
extension Book {
    static internal let logger: Logger = .init()
    static internal let delegate: BookDelegate = .default
}


import UniformTypeIdentifiers
extension Book {

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
    
}
