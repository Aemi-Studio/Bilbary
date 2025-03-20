//
//  StreakView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//
import SwiftUI
import SwiftData



struct StreakView: View {
    
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
    
    var todayTotalTime: TimeInterval {
        if let todayUsage = dailyUsage.first(where: { Calendar.current.isDateInToday($0.day) }) {
            return todayUsage.totalTime
        }
        return 0
    }
    
    
    @Environment(\.modelContext) private var modelContext
    @Query private var preferences: [UserPreferences]

    let timeSpent: TimeInterval

    @State private var toggleState: Bool = false
    @State private var animatedProgress: Double = 0.0

    private var userPreferences: UserPreferences {
        if let existing = preferences.first {
            return existing
        } else {
            let newPreferences = UserPreferences()
            modelContext.insert(newPreferences)
            return newPreferences
        }
    }

    var computedProgress: Double {
        min(todayTotalTime / Double(userPreferences.selectedGoal.rawValue), 1.0)
    }

    var isTodayActive: Bool {
        todayTotalTime >= Double(userPreferences.selectedGoal.rawValue)
    }

    var body: some View {
        VStack {
            HStack {
                Text("3 Streak")
                    .font(.title)
                    .bold()

                Spacer()

                ZStack {
                    Circle()
                        .stroke(
                            Color.white.opacity(0.3),
                            lineWidth: 4
                        )
                    Circle()
                        .trim(from: 0, to: animatedProgress)
                        .stroke(
                            Color.white,
                            style: StrokeStyle(
                                lineWidth: 4,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                }
                .frame(width: 30, height: 30)
            }
            .padding()

            WeekView(isTodayActive: isTodayActive)

            Spacer()

            VStack(spacing: 16) {
                HStack {
                    Text("Read for")
                    Spacer()
                    Menu {
                        ForEach(ReadGoal.allCases, id: \.self) { goal in
                            Button(goal.label) {
                                userPreferences.selectedGoal = goal
                                updateProgress()
                            }
                        }
                    } label: {
                        Text(userPreferences.selectedGoal.label)
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                HStack {
                    Text("Streak")
                    Spacer()
                    Menu {
                        Button("3 months", action: {  })
                        Button("6 months", action: { })
                        Button("12 months", action: { })
                    } label: {
                        Text("3 months")
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }

                HStack {
                    Text("Streak")
                    Spacer()
                    Toggle("", isOn: $toggleState)
                        .labelsHidden()
                        .tint(Color.gray.opacity(0.6))
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            animatedProgress = 0.0
            withAnimation(.easeOut(duration: 0.5)) {
                animatedProgress = computedProgress
            }
        }
    }

    private func updateProgress() {
        animatedProgress = 0.0
        withAnimation(.easeOut(duration: 0.5)) {
            animatedProgress = computedProgress
        }
    }
}
