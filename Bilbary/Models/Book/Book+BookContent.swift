//
//  Book+BookContent.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation

extension Book {
    struct BookContent {
        private let rawContent: [String]
        init?(from content: [String]?) {
            guard let content = content else {
                return nil
            }
            self.rawContent = content
        }

        public var strings: [String] {
            self.rawContent
        }
    }
}
