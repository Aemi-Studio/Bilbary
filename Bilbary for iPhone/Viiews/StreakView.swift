//
//  StreakView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//
import SwiftUI
import SwiftData

@Model
class UserPreferences {
    var selectedGoal: ReadGoal

    init(selectedGoal: ReadGoal = .twoHours) {
        self.selectedGoal = selectedGoal
    }
}

enum ReadGoal: Int, CaseIterable, Codable {
    case fiveMinutes = 300
    case tenMinutes = 600
    case fifteenMinutes = 900
    case fortyMinutes = 2400
    case oneHour = 3600
    case twoHours = 7200
    case sixHours = 21600
    
    var label: String {
        switch self {
        case .fiveMinutes:
            return "5 minutes"
        case .tenMinutes:
            return "10 minutes"
        case .fifteenMinutes:
            return "15 minutes"
        case .fortyMinutes:
            return "40 minutes"
        case .oneHour:
            return "1 hour"
        case .twoHours:
            return "2 hours"
            
        case .sixHours :
            return "6 hours"
        }
    }
}

struct StreakView: View {
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
        min(timeSpent / Double(userPreferences.selectedGoal.rawValue), 1.0)
    }

   
    var isTodayActive: Bool {
        timeSpent >= Double(userPreferences.selectedGoal.rawValue)
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
