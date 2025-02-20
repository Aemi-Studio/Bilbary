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
        var readTime: Double = 0.0

        @AppStorage("selectedReadTime")
        var selectedReadTime: Int = 0

        @AppStorage("selectedStreakDuration")
        var selectedStreakDuration: Int = 0

        @AppStorage("totalReadTime")
        var totalReadTime: Double = 0.0

        @AppStorage("currentStreakStartDate")
        var currentStreakStartDate: Double = -1.0

        @AppStorage("currentStreakEndDate")
        var currentStreakEndDate: Double = -1.0

        @AppStorage("lastStreakEndDate")
        var lastStreakEndDate: Double = -1.0
    }
}
