//
//  Book+BookProgress.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 02/03/24.
//

import Foundation
import SwiftData
import OSLog

@Model
final class BookProgress: Identifiable, Hashable {

    @Attribute(.unique)
    public let id: UUID = UUID()

    public internal(set) var book: Book
    public var startDate: Date = Date.now
    public var endDate: Date = Date.now
    public var startProgress: CGFloat = 0.0
    public var endProgress: CGFloat = 0.0
    public private(set) var readTime: TimeInterval = 0.0

    init(
        for book: Book,
        startedAt startDate: Date,
        from startProgress: CGFloat
    ) {
        self.book = book
        self.startDate = startDate
        self.startProgress = startProgress
    }

    public func increment(_ step: TimeInterval) {
        self.readTime += step
    }
}
