//
//  WeekView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//
import SwiftUI

struct WeekView: View {
    
    let isTodayActive: Bool

    var body: some View {
       
        let weekdaySymbols = ["M", "T", "W", "T", "F", "S", "S"]
       
        let calendar = Calendar.current
        let weekdayComponent = calendar.component(.weekday, from: Date())
        // In Calendar, Sunday is 1, Monday is 2, ..., Saturday is 7.
        // Monday to be index 0. So adjust accordingly:
        let todayIndex = (weekdayComponent + 5) % 7

        return RoundedRectangle(cornerRadius: 12)
            .fill(Color.black.opacity(0.4))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .overlay(
                HStack(spacing: 20) {
                    ForEach(0..<weekdaySymbols.count, id: \.self) { index in
                        VStack(spacing: 6) {
                          
                            if index == todayIndex {
                                if isTodayActive {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 13, height: 13)
                                } else {
                                    Circle()
                                        .stroke(Color.white.opacity(0.7), lineWidth: 2)
                                        .frame(width: 13, height: 13)
                                }
                            } else {
                    
                                Circle()
                                    .stroke(Color.white.opacity(0.7), lineWidth: 2)
                                    .frame(width: 13, height: 13)
                            }

                            Text(weekdaySymbols[index])
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.vertical, 12)
            )
            .padding(.horizontal)
    }
}


