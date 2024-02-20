//
//  GoalReadTime+String.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation

extension GoalReadTime {
    var asString: String {
        return switch self {
            case .none:
                NSLocalizedString(
                    "goalReadTime.0min",
                    comment: "No Reading Time Goal"
                )
            case .aMin:
                NSLocalizedString(
                    "goalReadTime.1min",
                    comment: "Reading Time Goal of 1 minute"
                )
            case .fiveMin:
                NSLocalizedString(
                    "goalReadTime.5min",
                    comment: "Reading Time Goal of 5 minutes"
                )
            case .tenMin:
                NSLocalizedString(
                    "goalReadTime.10min",
                    comment: "Reading Time Goal of 10 minutes"
                )
            case .thirtyMin:
                NSLocalizedString(
                    "goalReadTime.30min",
                    comment: "Reading Time Goal of 30 minutes"
                )
            case .anHour:
                NSLocalizedString(
                    "goalReadTime.60min",
                    comment: "Reading Time Goal of 60 minutes"
                )
        }
    }
}
