//
//  LibraryModel.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation

@Observable
final class LibraryModel {

    public static let shared: LibraryModel = .init()

    private var displayedBooksFilter: LibraryFilter = .history

    public var displayedBooks: LibraryFilter.RawValue {
        get {
            self.displayedBooksFilter.rawValue
        }
        set {
            self.displayedBooksFilter = LibraryFilter(rawValue: newValue) ?? .history
        }
    }

    public var openedBooks: [Book] = Book.localBooks

    public var searchText: String = ""

    private init() {}

}
