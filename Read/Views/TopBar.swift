//
//  TopBar.swift
//  Read for iPad & macOS
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

struct TopBar: View {

    @State
    private var view: ViewModel = .shared

    var body: some View {

        RBarRow {
            RButton(
                isShown: $view.interfaceVisibility,
                title: NSLocalizedString("Library", comment: "Library"),
                systemImage: "books.vertical",
                systemImageActive: "books.vertical.fill",
                linkedTo: .library
            ) {
                view.libraryVisibility.toggle()
            }
        } center: {
            RPopover(isShown: $view.interfaceVisibility, type: .readingTime) {
                HStack(spacing: 0) {
                    Group {
                        Text("5 Min")
                            .fontWeight(.bold)
                        Text(" Read")
                            .opacity(0.5)
                    }
                }
            } popover: {
                HStack {}.frame(width: 200, height: 100)
            }
        } trailing: {
            RPopover(
                isShown: $view.interfaceVisibility,
                title: NSLocalizedString("Streak", comment: ""),
                systemImage: "timer",
                type: .goalStreak
            ) {
                GoalStreakView()
            }
        }
    }
}

#Preview {
    TopBar()
}
