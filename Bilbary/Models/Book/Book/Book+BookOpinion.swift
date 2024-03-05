//
//  Book+BookOpinion.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 02/03/24.
//

import Foundation

extension Book {

    enum BookOpinion: Int, CaseIterable, Codable {
        case undefined = 0
        case liked = 1
        case skipped = 2
        case disliked = 3

        @discardableResult
        mutating func toggle() -> Self {
            if self != .liked {
                self = .liked
            } else {
                self = .undefined
            }
            return self
        }
    }

}
