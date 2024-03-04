//
//  Books.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import Foundation

typealias Books = [Book]
typealias BooksMaybe = [Book? ]

extension BooksMaybe {

    var nonNil: [Book] {
        self.compactMap { $0 }
    }

}
