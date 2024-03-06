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
                    #if os(iOS)
                    Text(LocalizedStringKey("goalModel.readTimePicker"))
                        .fontWeight(.semibold)
                    Spacer()
                    #endif
                    Picker(
                        NSLocalizedString("goalModel.readTimePicker", comment: "Picker for Reading Time"),
                        selection: self.$goalModel.selectedReadTime
                    ) {
                        ForEach(GoalReadTime.allCases, id: \.id) { (time: GoalReadTime) in
                            Text("\(time.asString)")
                                .tag(time.id)
                                .id(time.id)
                        }
                    }
                    .pickerStyle(.menu)
                }

                HStack {
                    #if os(iOS)
                    Text(LocalizedStringKey("goalModel.streakDurationPicker"))
                        .fontWeight(.semibold)
                    Spacer()
                    #endif
                    Picker(
                        NSLocalizedString(
                            "goalModel.streakDurationPicker",
                            comment: "Picker for Streak Duration"
                        ),
                        selection: self.$goalModel.selectedStreakDuration
                    ) {
                        ForEach(GoalStreakDuration.allCases, id: \.id) { (duration: GoalStreakDuration) in
                            Text("\(duration.asString)")
                                .tag(duration.id)
                                .id(duration.id)
                        }
                    }
                    .pickerStyle(.menu)
                }

                HStack {
                    Toggle(isOn: $goalModel.beNotified) {
                        Text(
                            NSLocalizedString(
                                "goalModel.beNotified",
                                comment: "Be notified to achieve my goal"
                            )
                        )
                        .fontWeight(.semibold)
                    }
                    .tint(Color.userDefinedForeground.secondary)
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
