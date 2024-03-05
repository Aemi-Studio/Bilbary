//
//  Book+Static+Local.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import SwiftUI

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
        self.localBooksUrls
            .compactMap({Book(from: $0)})
            .filter({ $0.content?.strings.count ?? 0 > 0 })
    }
}
