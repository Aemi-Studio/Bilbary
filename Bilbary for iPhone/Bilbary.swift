//
//  Bilbary_for_iPhoneApp.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

@main
struct Bilbary: App {
    @StateObject private var appUsageTracker = AppUsageTracker()

      @Environment(\.scenePhase) private var scenePhase

      var body: some Scene {
          WindowGroup {
              TimerView()
                  .environmentObject(appUsageTracker)
                  .onAppear {
                      appUsageTracker.startSession()
                  }
                  .onDisappear {
                      appUsageTracker.endSession()
                  }
          }
          .onChange(of: scenePhase) {
              switch scenePhase {
              case .active:
                  appUsageTracker.resumeSession()
              case .inactive:
                  appUsageTracker.pauseSession()
              case .background:
                  appUsageTracker.pauseSession()
              @unknown default:
                  break
              }
          }
      }
  }
