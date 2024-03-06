//
//  GoalStreakDuration+Formatter.swift
//  Bilbary for iPad
//
//  Created by Guillaume Coquard on 04/03/24.
//

import Foundation

extension GoalStreakDuration {

    static public var formatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.day, .month]
        return formatter
    }

}
