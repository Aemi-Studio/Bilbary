//
//  Bilbary_for_iPhoneApp.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

@main
@MainActor
struct Bilbary: App {

    @State
    private var appUsageTracker = AppUsageTracker()

    var body: some Scene {
        WindowGroup {
            BilbaryView()
                .environment(appUsageTracker)

        }
        .modelContainer(AppModelContainer)
    }
}
