//
//  Book+Hashable.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation
extension Book: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.title)
        hasher.combine(self.author)
        hasher.combine(self.publisher)
    }
}
