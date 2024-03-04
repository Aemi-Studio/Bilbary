//
//  Book+BookProgress.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 02/03/24.
//

import Foundation

struct BookProgress: Identifiable, Hashable {

    let id: UUID = .init()
    var startDate: Date = .now
    var endDate: Date = .now
    var startProgress: CGFloat = 0.0
    var endProgress: CGFloat = 0.0

    var duration: TimeInterval {
        self.endDate.timeIntervalSince(self.startDate)
    }

    var progress: CGFloat {
        self.endProgress - self.startProgress
    }

    init(
        startedAt startDate: Date,
        endedAt endDate: Date,
        from startProgress: CGFloat,
        to endProgress: CGFloat
    ) {
        self.startDate = startDate
        self.endDate = endDate
        self.startProgress = startProgress
        self.endProgress = endProgress
    }
}
