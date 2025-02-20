//
//  Book+BookReadingStatus.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 02/03/24.
//

import Foundation

enum BookReadingStatus: Int, CaseIterable, Codable {
    case undefined = 0
    case started = 1
    case finished = 2
    case abandonned = 3
}
