//
//  determineHigherValue.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 10/07/24.
//
import SwiftUI
import Combine
import SwiftData

@Observable
class AppUsageTracker {

    var currentSession: ReadSession?

    func startSession(to context: ModelContext) {
        guard currentSession == nil else { return }
        currentSession = .init()
    }

    func endSession(to context: ModelContext) {
        if let currentSession = currentSession {
            context.insert(currentSession.end())
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
        self.currentSession = nil
    }

    func computeTimeSpentToday(_ sessions: ReadSession...) -> TimeInterval {
        self.computeTimeSpentToday(sessions)
    }

    func computeTimeSpentToday(_ sessions: [ReadSession]) -> TimeInterval {
        var duration: TimeInterval = 0
        for session in sessions {
            if let endTime = session.endTime {
                duration += session.startTime.distance(to: endTime)
            }
        }
        if let currentSession = currentSession {
            duration += currentSession.startTime.distance(to: .now)
        }
        return duration
    }
}
