//
//  StreakView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//
import SwiftUI

struct StreakView: View {
    @State private var toggleState: Bool = false
    @State private var progress: Double = 0.7 // Example progress value (0.0 to 1.0)
    
    var body: some View {
        VStack {
            HStack {
                Text("3 Streak")
                    .font(.title)
                    .bold()
                
                Spacer()
            
                ZStack {
                    Circle()
                        .stroke(
                            Color.white.opacity(0.3),
                            lineWidth: 4
                        )
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.white,
                            style: StrokeStyle(
                                lineWidth: 4,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                }
                .frame(width: 40, height: 40)
            }
            .padding()
            
            WeekView()
            Spacer()
            
            VStack(spacing: 16) {
                HStack {
                    Text("Read for")
                    Spacer()
                    Menu {
                        Button("5 minutes", action: { })
                        Button("10 minutes", action: { })
                        Button("15 minutes", action: { })
                    } label: {
                        Text("5 minutes")
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                HStack {
                    Text("Streak")
                    Spacer()
                    Menu {
                        Button("3 months", action: {  })
                        Button("6 months", action: { })
                        Button("12 months", action: { })
                    } label: {
                        Text("3 months")
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                HStack {
                    Text("Streak")
                    Spacer()
                    Toggle("", isOn: $toggleState)
                        .labelsHidden()
                        .tint(Color.gray.opacity(0.6))
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
