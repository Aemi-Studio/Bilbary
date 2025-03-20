//
//  ReadGoal.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 20/03/25.
//

import Foundation

enum ReadGoal: Int, CaseIterable, Codable {
    case fiveMinutes = 300
    case tenMinutes = 600
    case fifteenMinutes = 900
    case fortyMinutes = 2400
    case oneHour = 3600
    case twoHours = 7200
    case sixHours = 21600

    var label: String {
        switch self {
        case .fiveMinutes:
            return "5 minutes"
        case .tenMinutes:
            return "10 minutes"
        case .fifteenMinutes:
            return "15 minutes"
        case .fortyMinutes:
            return "40 minutes"
        case .oneHour:
            return "1 hour"
        case .twoHours:
            return "2 hours"

        case .sixHours:
            return "6 hours"
        }
    }
}
