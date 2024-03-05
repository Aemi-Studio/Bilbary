//
//  GoalStreakDuration.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation

enum GoalStreakDuration: Int, CaseIterable {
    case aWeek = 7
    case twoWeeks = 14
    case aMonth = 30
    case threeMonths = 90
    case sixMonths = 180
    case aYear = 365
    case forever = -1

    var timeInterval: TimeInterval {
        TimeInterval(self.rawValue * 24 * 3600)
    }
}
