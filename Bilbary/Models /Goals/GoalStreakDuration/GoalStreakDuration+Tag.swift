//
//  GoalStreakDuration+Tag.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation

extension GoalStreakDuration {

    var id: Int {
        return switch self {
        case Self.none:
            0
        case Self.aWeek:
            1
        case Self.twoWeeks:
            2
        case Self.aMonth:
            3
        case Self.threeMonths:
            4
        case Self.sixMonths:
            5
        case Self.aYear:
            6
        }
    }

    static func from(_ id: Int) -> Self? {
        return switch id {
        case 0:
            Self.none
        case 1:
            Self.aWeek
        case 2:
            Self.twoWeeks
        case 3:
            Self.aMonth
        case 4:
            Self.threeMonths
        case 5:
            Self.sixMonths
        case 6:
            Self.aYear
        default:
            nil
        }
    }

}
