//
//  StreakView.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

struct GoalStreakView: View {

    @State
    private var goalModel: GoalModel = .shared

    var body: some View {
        VStack(spacing: 16) {

            StreakWeekRowView()

            VStack {
                HStack {
                    Picker(
                        NSLocalizedString("goalModel.readTimePicker", comment: "Picker for Reading Time"),
                        selection: self.$goalModel.readTime
                    ) {
                        ForEach(GoalReadTime.allCases, id: \.self) { time in
                            Text(time.asString).tag(time.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                }

                HStack {
                    Picker(
                        NSLocalizedString("goalModel.streakDurationPicker", comment: "Picker for Streak Duration"),
                        selection: self.$goalModel.streakDuration
                    ) {
                        ForEach(GoalStreakDuration.allCases, id: \.self) { duration in
                            Text(duration.asString).tag(duration.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                }

                HStack {
                    Toggle(isOn: $goalModel.beNotified) {
                        Text(
                            NSLocalizedString("goalModel.beNotified", comment: "Be notified to achieve my goal")
                        )
                    }
                }
            }
        }
        .frame(minWidth: 200)
        .padding()
    }
}

#Preview {
    GoalStreakView()
}
