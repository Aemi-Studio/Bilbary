//
//  GoalReadTime+String.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 23/02/24.
//

import Foundation

extension GoalReadTime {
    var asString: String {
        return switch self {
        case .none:
            NSLocalizedString(
                "goalReadTime.none",
                comment: "No reading time goal"
            )
        default:
            ReadTime(rawValue: self.rawValue)!.asString
        }
    }
}
