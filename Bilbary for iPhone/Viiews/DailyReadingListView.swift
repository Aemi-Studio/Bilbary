//
//  DailyReadingListView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 14/02/25.
//

// import SwiftUI
// import SwiftData
//
// struct DailyReadingListView: View {
//    // Query all DailyReading objects.
//    @Query private var dailyReadings: [DailyReading]
//
//    var body: some View {
//        NavigationStack {
//            List(dailyReadings) { reading in
//                VStack(alignment: .leading) {
//                    Text(reading.date, style: .date)
//                        .font(.headline)
//                    Text("Total: \(Int(reading.totalTime)) seconds")
//                        .font(.subheadline)
//                }
//            }
//            .navigationTitle("Daily Readings")
//        }
//    }
// }
//
// #Preview {
//    DailyReadingListView()
//        .modelContainer(AppModelContainer)
// }
