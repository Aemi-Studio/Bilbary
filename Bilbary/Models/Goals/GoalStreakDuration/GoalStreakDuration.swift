//
//  GoalStreakDuration.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation

enum GoalStreakDuration: Int, Identifiable, CaseIterable {

    case none = 0
    case aWeek = 7
    case twoWeeks = 14
    case aMonth = 30
    case threeMonths = 90
    case sixMonths = 180
    case aYear = 365

    init?(from id: Int) {
        guard let goal: Self = Self.from(id) else {
            return nil
        }
        self = goal
    }
}
