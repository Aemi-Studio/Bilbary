//
//  BStreakPopover.swift
//  Bilbary for iPad
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BStreakPopover: View {

    @State
    private var viewModel: BViewModel = .shared

    @State
    private var readModel: BReadModel = .shared

    @State
    private var goalModel: GoalModel = .shared

    var body: some View {
        HStack {

            BPopover(
                isShown: $viewModel.isInterfaceVisible,
                type: .goalStreak
            ) {
                HStack(spacing: 8) {
                    BStreakValidation()
                    if goalModel.currentStreakDurationAsDays > 2 {
                        HStack(spacing: 0) {
                            Group {
                                Text(GoalStreakDuration.formatter.string(from: goalModel.currentStreakDuration)!)
                                    + Text(" ")
                                Text(
                                    NSLocalizedString(
                                        "button.streak",
                                        comment: "Streak word display on the interface UI"
                                    )
                                )
                                .opacity(0.5)
                                .padding(.leading, 4)
                            }
                            .textCase(.uppercase)
                            .fontWeight(.bold)
                        }
                    }
                }
            } popover: {
                GoalStreakView()
            }
        }
    }
}

#Preview {
    BStreakPopover()
}
