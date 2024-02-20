//
//  GoalModel.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI
import OSLog

@Observable
final class GoalModel {

    static let shared: GoalModel = .init()

    private let center: NotificationCenter = .default
    private let storage: GoalModelStorage = .init()
    private let logger: Logger = .goals

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

    var readTime: Int = 0 {
        didSet {
            self.storage.readTime = self.readTime
        }
    }

    var streakDuration: Int = -1 {
        didSet {
            self.storage.streakDuration = self.streakDuration
        }
    }

    var currentStreakStartDate: Int = -1 {
        didSet {
            self.storage.currentStreakStartDate = self.currentStreakStartDate
        }
    }

    var lastStreakEndDate: Int = -1 {
        didSet {
            self.storage.lastStreakEndDate = self.lastStreakEndDate
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
        self.streakDuration = self.storage.streakDuration
        self.currentStreakStartDate = self.storage.currentStreakStartDate
        self.lastStreakEndDate = self.storage.lastStreakEndDate
    }

}
