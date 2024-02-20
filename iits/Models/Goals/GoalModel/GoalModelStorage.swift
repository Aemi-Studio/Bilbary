//
//  GoalModelStorage.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

extension GoalModel {
    internal struct GoalModelStorage {
        @AppStorage("beNotified")
        var beNotified: Bool = false

        @AppStorage("readTime")
        var readTime: Int = 1

        @AppStorage("readTime")
        var streakDuration: Int = -1

        @AppStorage("currentStreakStartDate")
        var currentStreakStartDate: Int = -1

        @AppStorage("lastStreakEndDate")
        var lastStreakEndDate: Int = -1
    }
}
