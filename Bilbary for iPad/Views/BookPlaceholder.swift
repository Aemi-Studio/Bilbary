//
//  BookPlaceholder.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation

struct BookPlaceholder: Hashable {

    let url: URL?

    init(from url: URL?) {
        self.url = url
    }
}
