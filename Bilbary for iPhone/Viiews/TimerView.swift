//
//  timerView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 10/07/24.
//


import SwiftUI
import SwiftData

extension TimeInterval {
    var formattedTime: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = [.pad]
        return formatter.string(from: self) ?? "00:00:00"
    }
}

struct DailyUsageView: View {
    
    let sessions: [ReadSession]
    
   
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
    
    var body: some View {
        NavigationView {
            List(dailyUsage, id: \.day) { usage in
                VStack(alignment: .leading, spacing: 8) {

                    Text(usage.day, style: .date)
                        .font(.headline)
                  
                    Text("Total Time: \(usage.totalTime.formattedTime)")
                   
                    Text("Sessions: \(usage.sessionCount)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Daily Usage")
        }
    }
}


