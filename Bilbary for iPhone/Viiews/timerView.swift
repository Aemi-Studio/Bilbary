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
    /// An array of sessions recorded by your app.
    let sessions: [ReadSession]
    
    /// Groups sessions by day (based on their startTime) and calculates the total time and session count per day.
    var dailyUsage: [(day: Date, totalTime: TimeInterval, sessionCount: Int)] {
        let calendar = Calendar.current
        // Group sessions by the start of the day they occurred.
        let grouped = Dictionary(grouping: sessions) { session in
            calendar.startOfDay(for: session.startTime)
        }
        // Map each group to a tuple with the day, the total time for that day, and the number of sessions.
        let usageArray = grouped.map { (day, sessions) in
            let totalTime = sessions.reduce(0) { $0 + $1.duration }
            return (day: day, totalTime: totalTime, sessionCount: sessions.count)
        }
        // Sort descending so that the most recent day appears first.
        return usageArray.sorted { $0.day > $1.day }
    }
    
    var body: some View {
        NavigationView {
            List(dailyUsage, id: \.day) { usage in
                VStack(alignment: .leading, spacing: 8) {
                    // Display the day.
                    Text(usage.day, style: .date)
                        .font(.headline)
                    // Display the total time spent on that day.
                    Text("Total Time: \(usage.totalTime.formattedTime)")
                    // Display the number of sessions.
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

//import SwiftUI
//import SwiftData
//
//extension TimeInterval {
//    var formattedTime: String {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute, .second]
//        formatter.unitsStyle = .positional
//        formatter.zeroFormattingBehavior = [.pad]
//        return formatter.string(from: self) ?? "00:00:00"
//    }
//}
//
//struct TimerView: View {
//    
//    let timeSpent: TimeInterval?
//
//    let sessionsCount: Int
//
// 
//    @State private var currentSessionTime: TimeInterval = 0
//    
//    private let timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()
//
//  
//    @State private var sessionStartTime = Date()
//
//    var body: some View {
//        VStack(spacing: 16) {
//           
//            VStack {
//                Text("Session Summary")
//                    .font(.largeTitle)
//                    .bold()
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: 200)
//            .background(.bar)
//            .clipShape(RoundedRectangle(cornerRadius: 8))
//            .padding()
//
//            ScrollView {
//                VStack(spacing: 20) {
//                
//                    if let timeSpent = timeSpent {
//                        VStack(spacing: 8) {
//                            Text("Total Time")
//                                .font(.headline)
//                                .foregroundColor(.secondary)
//
//                            Text(timeSpent.formattedTime)
//                                .font(.title)
//                                .bold()
//
//                            Text("\(sessionsCount) total session\(sessionsCount == 1 ? "" : "s")")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                        }
//                        .padding()
//                        .background(.ultraThinMaterial)
//                        .clipShape(RoundedRectangle(cornerRadius: 12))
//                    }
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
//        }
//        .onAppear {
//
//            sessionStartTime = Date()
//        }
//        .onReceive(timer) { _ in
//            
//            currentSessionTime = Date().timeIntervalSince(sessionStartTime)
//        }
//    }
//}
//
//
//#Preview {
//    TimerView(timeSpent: 3600, sessionsCount: 5)
//}

