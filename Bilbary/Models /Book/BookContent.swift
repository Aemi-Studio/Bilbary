//
//  Book+BookContent.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation

struct BookContent: Hashable {

    private let rawContent: [String]

    public let formatted: [BookParagraph]

    init(_ content: [String] = []) {
        self.rawContent = content
        self.formatted = BookParagraph.from(self.rawContent)
    }

}

extension BookContent: Equatable {

}
