//
//  timerView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 10/07/24.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var appUsageTracker: AppUsageTracker

    var body: some View {
        VStack {
            Text("Total Time Spent: \(appUsageTracker.totalTimeSpent, specifier: "%.2f") seconds")
                .padding()
        }
        .onAppear {
            appUsageTracker.loadTotalTimeSpent()
        }
    }
}

//struct timerView: PreviewProvider {
//    static var previews: some View {
//       timerView()
//            .environmentObject(AppUsageTracker())
//    }
//}
