//
//  ViewModel.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 20/03/25.
//

import Foundation


extension StreakView {
    @Observable class ViewModel {
        var sessions: [ReadSession]

        var dailyUsage: [(day: Date, totalTime: TimeInterval, sessionCount: Int)] {
            let calendar = Calendar.current

            let grouped = Dictionary(grouping: sessions) { session in
                calendar.startOfDay(for: session.startTime)
            }

            let usageArray = grouped.map { (day, sessions) in
                let totalTime = sessions.reduce(0) { $0 + $1.duration }
                return (day: day, totalTime: totalTime, sessionCount: sessions.count)
            }

            return usageArray.sorted { $0.day > $1.day }
        }
        
        var todayTotalTime: TimeInterval {
            if let todayUsage = dailyUsage.first(where: { Calendar.current.isDateInToday($0.day) }) {
                return todayUsage.totalTime
            }
            return 0
        }
        
        init(sessions: [ReadSession]) {
                self.sessions = sessions
            }
    }
}
