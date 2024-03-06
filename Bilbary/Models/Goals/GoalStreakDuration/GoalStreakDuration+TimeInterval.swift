//
//  GoalStreakDuration+TimeInterval.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation

extension GoalStreakDuration {
    var timeInterval: TimeInterval {
        TimeInterval(self.rawValue * 24 * 3600)
    }
}
