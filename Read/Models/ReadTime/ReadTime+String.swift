//
//  ReadTime+String.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation

extension ReadTime {
    var asString: String {
        return switch self {
        case .aMin:
            NSLocalizedString(
                "readTime.1min",
                comment: "Reading Time Goal of 1 minute"
            )
        case .fiveMin:
            NSLocalizedString(
                "readTime.5min",
                comment: "Reading Time Goal of 5 minutes"
            )
        case .tenMin:
            NSLocalizedString(
                "readTime.10min",
                comment: "Reading Time Goal of 10 minutes"
            )
        case .thirtyMin:
            NSLocalizedString(
                "readTime.30min",
                comment: "Reading Time Goal of 30 minutes"
            )
        case .anHour:
            NSLocalizedString(
                "readTime.60min",
                comment: "Reading Time Goal of 60 minutes"
            )
        }
    }
}
