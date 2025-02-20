//
//  BBookProgressCircle.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import SwiftUI

struct BBookProgressCircle: View {

    var book: Book

    var body: some View {
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
                .trim(from: 0, to: self.book.readingProgress / 100.0)
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
}
