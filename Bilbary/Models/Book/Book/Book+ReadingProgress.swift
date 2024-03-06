//
//  Book+ReadingProgress.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import Foundation

// MARK: Reading Progress
extension Book {

    public var readingTime: TimeInterval {
        var total: TimeInterval = 0.0
        for session in self.readingSessions {
            total += session.readTime
        }
        return total
    }

    public var readingProgress: CGFloat {
        self.readingSessions.last?.endProgress ?? 0.0
    }

    public var readingStartDate: Date? {
        self.readingSessions.first?.startDate
    }

    public var readingEndDate: Date? {
        self.readingSessions.last?.endDate
    }

}
