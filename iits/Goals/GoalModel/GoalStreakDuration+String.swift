//
//  GoalStreakDuration+String.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation

extension GoalStreakDuration {
    var asString: String {
        return switch self {
            case .aWeek:
                NSLocalizedString(
                    "goalStreakDuration.7days",
                    comment: "Goal Streak Duration of 7 days or 1 week"
                )
            case .twoWeeks:
                NSLocalizedString(
                    "goalStreakDuration.14days",
                    comment: "Goal Streak Duration of 14 days or 2 weeks"
                )
            case .aMonth:
                NSLocalizedString(
                    "goalStreakDuration.30days",
                    comment: "Goal Streak Duration of 30 days or 1 month"
                )
            case .threeMonths:
                NSLocalizedString(
                    "goalStreakDuration.90days",
                    comment: "Goal Streak Duration of 90 days or 3 months"
                )
            case .sixMonths:
                NSLocalizedString(
                    "goalStreakDuration.180days",
                    comment: "Goal Streak Duration of 180 days or 6 months"
                )
            case .aYear:
                NSLocalizedString(
                    "goalStreakDuration.365days",
                    comment: "Goal Streak Duration of 365 days or 1 year"
                )
            case .forever:
                NSLocalizedString(
                    "goalStreakDuration.unlimited",
                    comment: "No Goal Streak Duration or forever"
                )
        }
    }
}
