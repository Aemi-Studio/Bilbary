//
//  ContentView.swift
//  iits
//
//  Created by Guillaume Coquard on 13/02/24.
//

import SwiftUI

struct ContentView: View {

    @State
    private var isPopoverPresented: Bool = false

    @State
    private var goalModel: GoalModel = .shared

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)

            Text("Hello, world!")

            PopOver {
                Label("Streak", systemImage: "timer")
            } popover: {
                GoalStreakView()
            }

            PopOver {
                Label("Text Customization", systemImage: "textformat.size")
            } popover: {
                Customization()
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
