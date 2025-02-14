//
//  timerView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 10/07/24.
//
import SwiftUI
import SwiftData

extension TimeInterval {
    var formattedTime: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = [.pad]
        return formatter.string(from: self) ?? "00:00:00"
    }
}

struct TimerView: View {
    
    let timeSpent: TimeInterval?

    let sessionsCount: Int

 
    @State private var currentSessionTime: TimeInterval = 0
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()

  
    @State private var sessionStartTime = Date()

    var body: some View {
        VStack(spacing: 16) {
           
            VStack {
                Text("Session Summary")
                    .font(.largeTitle)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.bar)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()

            ScrollView {
                VStack(spacing: 20) {
                
                    if let timeSpent = timeSpent {
                        VStack(spacing: 8) {
                            Text("Total Time")
                                .font(.headline)
                                .foregroundColor(.secondary)

                            Text(timeSpent.formattedTime)
                                .font(.title)
                                .bold()

                            Text("\(sessionsCount) total session\(sessionsCount == 1 ? "" : "s")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

           
                    VStack(spacing: 8) {
                        Text("Current Session")
                            .font(.headline)
                            .foregroundColor(.secondary)

                        Text(currentSessionTime.formattedTime)
                            .font(.title)
                            .bold()
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {

            sessionStartTime = Date()
        }
        .onReceive(timer) { _ in
            
            currentSessionTime = Date().timeIntervalSince(sessionStartTime)
        }
    }
}


#Preview {
    TimerView(timeSpent: 3600, sessionsCount: 5)
}

