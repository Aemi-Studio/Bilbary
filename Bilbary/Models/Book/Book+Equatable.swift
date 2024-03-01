//
//  Book+Equatable.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation

extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs.url == rhs.url
    }
}
