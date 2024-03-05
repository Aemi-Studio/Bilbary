//
//  BStreakValidation.swift
//  Bilbary for iPad
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI
import Combine
import OSLog

struct BStreakValidation: View {

    @State
    private var goalModel: GoalModel = .shared

    var body: some View {
        HStack {
            Image(systemName: "circle")
                .foregroundStyle(.clear)
        }
        .background {
            Circle()
                .trim(
                    from: 0,
                    to: goalModel.streakValidationProgress
                )
                .fill(!goalModel.isStreakValidated ? .clear : .primary)
                .stroke(
                    Color.primary,
                    style: StrokeStyle(
                        lineWidth: BConstants.coverCircularProgressStrokeWidth * 0.75,
                        lineCap: .round
                    )
                )
                .foregroundStyle(!goalModel.isStreakValidated ? .clear : .primary)
        }
        .overlay {
            Label(
                "Streak Validated",
                systemImage: "checkmark"
            )
            .labelStyle(.iconOnly)
            .font(.caption)
            .foregroundStyle(!goalModel.isStreakValidated ? .clear : .background)
        }
        .fontWeight(.heavy)
        .onReceive(BReadModel.timer) { _ in
            if !goalModel.isStreakValidated {
                DispatchQueue.main.async {
                    withAnimation(.linear(duration: BReadModel.timerIncrement)) {
                        goalModel.streakValidationProgressRemaining = goalModel.streakValidationProgressRemaining - BReadModel.timerIncrement
                    }
                }
            }
        }
    }
}
