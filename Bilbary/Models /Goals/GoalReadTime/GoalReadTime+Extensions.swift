//
//  GoalReadTime+Extensions.swift
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

    var timeInterval: TimeInterval {
        return if self == .none {
            60.0
        } else {
            TimeInterval(self.rawValue * 60)
        }
    }

    var id: Int {
        return switch self {
        case Self.none:
            0
        case Self.aMin:
            1
        case Self.fiveMin:
            2
        case Self.tenMin:
            3
        case Self.thirtyMin:
            4
        case Self.anHour:
            5
        }
    }

    static func from(_ id: Int) -> Self? {
        return switch id {
        case 0:
            Self.none
        case 1:
            Self.aMin
        case 2:
            Self.fiveMin
        case 3:
            Self.tenMin
        case 4:
            Self.thirtyMin
        case 5:
            Self.anHour
        default:
            nil
        }
    }
}
