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
    
    @State private var userPreferences = UserPreferences()
    
    
    

    var body: some Scene {
        WindowGroup {
            BilbaryView()
                .environment(appUsageTracker)
              //  .environmentObject(userPreferences)
                
        }
        .modelContainer(AppModelContainer)
    }
}
