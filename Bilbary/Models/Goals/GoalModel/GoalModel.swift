//
//  GoalModel.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI
import OSLog
import Combine

@Observable
final class GoalModel {

    static let shared: GoalModel = .init()
    private static let defaultReadTime: TimeInterval = 60.0

    private let center: NotificationCenter = .default
    private let storage: GoalModelStorage = .init()

    static private func from(timestamp: TimeInterval) -> Date {
        return if timestamp == -1 {
            Calendar.autoupdatingCurrent.startOfDay(for: Date.now)
        } else {
            Date(timeIntervalSince1970: timestamp)
        }
    }

    var streakValidationProgressRemaining: TimeInterval = GoalModel.defaultReadTime {
        didSet {
            if self.streakValidationProgressRemaining == 0 {
                DispatchQueue.main.async {
                    withAnimation {
                        self.isStreakValidated = true
                    }
                }
            }
        }
    }

    var streakValidationProgress: Double {
        (self.selectedReadTime.timeInterval - self.streakValidationProgressRemaining) / self.selectedReadTime.timeInterval
    }

    var isStreakValidated: Bool = false {
        didSet {
            self.currentStreakEndDate = Calendar.autoupdatingCurrent.startOfDay(for: Date.now)
        }
    }

    var selectedStreakDuration: GoalStreakDuration = .forever {
        didSet {
            self.storage.selectedStreakDuration = self.selectedStreakDuration.rawValue
        }
    }

    var selectedReadTime: GoalReadTime = .none {
        didSet {
            self.storage.selectedReadTime = self.selectedReadTime.rawValue
        }
    }

    var beNotified: Bool = false {
        didSet {
            self.storage.beNotified = self.beNotified
            if self.beNotified {
                Task {
                    await UNHelper.shared.updateAccess(request: true)
                }
            }
        }
    }

    var readTime: TimeInterval = 0 {
        didSet {
            self.storage.readTime = self.readTime
        }
    }

    var totalReadTime: TimeInterval = 0 {
        didSet {
            self.storage.totalReadTime = self.totalReadTime
        }
    }

    var currentStreakStartDate: Date? {
        didSet {
            self.storage.currentStreakStartDate = self.currentStreakStartDate?.timeIntervalSince1970 ?? -1.0
        }
    }

    var currentStreakEndDate: Date? {
        didSet {
            self.storage.currentStreakEndDate = self.currentStreakEndDate?.timeIntervalSince1970 ?? -1.0
        }
    }

    var currentStreakDuration: TimeInterval {
        let currentStreakStartDate = self.currentStreakStartDate
            ?? Calendar.autoupdatingCurrent.startOfDay(for: Date.now)

        let currentStreakEndDate = self.currentStreakEndDate
            ?? Calendar.autoupdatingCurrent.startOfDay(for: Date.now)

        return currentStreakEndDate.timeIntervalSince(currentStreakStartDate)
    }

    var currentStreakDurationAsDays: Int {
        Int((self.currentStreakDuration / (24 * 3600)).rounded())
    }

    var lastStreakEndDate: Date? {
        didSet {
            self.storage.lastStreakEndDate = self.lastStreakEndDate?.timeIntervalSince1970 ?? -1.0
        }
    }

    private init() {
        self.beNotified = self.storage.beNotified
        if self.beNotified {
            Task {
                await UNHelper.shared.updateAccess(request: true)
            }
        }
        self.readTime = self.storage.readTime
        self.totalReadTime = self.storage.totalReadTime
        self.selectedReadTime = GoalReadTime(rawValue: self.storage.selectedReadTime)!
        self.selectedStreakDuration = GoalStreakDuration(rawValue: self.storage.selectedStreakDuration)!
        self.currentStreakStartDate = Self.from(timestamp: self.storage.currentStreakStartDate)
        self.currentStreakEndDate = Self.from(timestamp: self.storage.currentStreakEndDate)
        self.lastStreakEndDate = Self.from(timestamp: self.storage.lastStreakEndDate)
        self.streakValidationProgressRemaining = self.selectedReadTime.timeInterval
    }

}
