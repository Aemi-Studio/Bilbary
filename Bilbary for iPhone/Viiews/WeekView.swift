//
//  WeekView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//
import SwiftUI

struct WeekView: View {
    
    let days: [(String, Bool)] = [
        ("M", true),
        ("T", true),
        ("W", true),
        ("T", false),
        ("F", false),
        ("S", false),
        ("S", false)
    ]
    
    var body: some View {
       
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.black.opacity(0.4))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.2), lineWidth: 1)
            )
            .overlay(
              
                HStack(spacing: 20) {
                    ForEach(days, id: \.0) { (dayLabel, isActive) in
                        VStack(spacing: 6) {
                          
                            if isActive {
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 16, height: 16)
                            } else {
                                Circle()
                                    .stroke(Color.white.opacity(0.7), lineWidth: 2)
                                    .frame(width: 16, height: 16)
                            }
                            
                           
                            Text(dayLabel)
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


#Preview {
    WeekView()
}
