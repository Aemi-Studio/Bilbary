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
        Bundle.main.urls(
            forResourcesWithExtension: UTType.epub.preferredFilenameExtension,
            subdirectory: nil
        ) ?? []
    }

    public static var localBooks: [Book] {
        self.localBooksUrls
            .compactMap({Book(from: $0)})
    }

    public static func randomBooksURL(_ count: Int) -> [URL] {
        let uniqueURLs = Set(Self.localBooksUrls)
        let finalCount = min(count, uniqueURLs.count)
        return Array(uniqueURLs.shuffled().prefix(finalCount))
    }

    public static func books(from urls: [URL], count: Int = 3) -> [Book] {
        urls.shuffled().prefix(count).compactMap {
            Book(from: $0)
        }
    }
}
