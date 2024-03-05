//
//  Book+View.swift
//  Bilbary for iPad
//
//  Created by Guillaume Coquard on 03/03/24.
//

import Foundation
import SwiftUI

extension Book {

    var progressCircle: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 100)
                .stroke(
                    Color.foreground.tertiary,
                    style: StrokeStyle(
                        lineWidth: BConstants.coverCircularProgressStrokeWidth,
                        lineCap: .round
                    )
                )
                .frame(
                    width: BConstants.coverCircularProgressWidth,
                    height: BConstants.coverCircularProgressWidth
                )

            Circle()
                //                .trim(from: 0, to: self.readingProgress / 100.0)
                .trim(from: 0, to: 72 / 100.0)
                .stroke(
                    Color.primary,
                    style: StrokeStyle(
                        lineWidth: BConstants.coverCircularProgressStrokeWidth,
                        lineCap: .round
                    )
                )
                .frame(
                    width: BConstants.coverCircularProgressWidth,
                    height: BConstants.coverCircularProgressWidth
                )
                .rotationEffect(.degrees(-90))
        }
    }

    var progressAsView: some View {
        ZStack {
            ZStack {
                VStack {
                    Group {
                        if let cover = self.cover {
                            ZStack {
                                cover.asyncImage
                                Rectangle()
                                    .foregroundStyle(.ultraThinMaterial)
                            }
                        } else {
                            Rectangle()
                                .foregroundStyle(.ultraThinMaterial)
                        }
                    }
                    .overlay(.black.opacity(0.1))
                    .bookCoverStyle()
                }
                self.progressCircle
            }
            Group {
                if self.readingStatus == .started {
                    Text(
                        self.readingProgress,
                        format: .number.rounded(
                            rule: .toNearestOrEven
                        )
                    )
                    .monospacedDigit()
                    .fontWeight(.medium)
                } else {
                    Label("Not started yet", systemImage: "book.closed.fill")
                        .labelStyle(.iconOnly)
                        .font(.caption)
                        .opacity(0.6)
                }
            }
        }
    }

}
