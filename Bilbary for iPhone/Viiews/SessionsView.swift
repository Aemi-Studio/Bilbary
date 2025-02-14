//
//  SessionsView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 14/02/25.
//

import SwiftUI
import SwiftData

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

struct SessionsListView: View {
 
    let sessions: [ReadSession]
    
    var body: some View {
        
        let sortedSessions = sessions.sorted(by: { $0.startTime > $1.startTime })
        let totalSessions = sortedSessions.count
        
        List(Array(sortedSessions.enumerated()), id: \.element.id) { index, session in
            let sessionNumber = totalSessions - index
            VStack(alignment: .leading, spacing: 8) {
                
                Text("Session #\(sessionNumber)")
                    .font(.headline)
                    .bold()
                
                
                Text("Started: \(session.startTime, formatter: dateFormatter)")
                    .font(.subheadline)
                
                if let endTime = session.endTime {
                    Text("Ended: \(endTime, formatter: dateFormatter)")
                        .font(.subheadline)
                } else {
                    Text("Ongoing")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                
              
                Text("Duration: \(Int(session.duration)) seconds")
                    .font(.title3)
                    .bold()
            }
            .padding(.vertical, 8)
        }
        .navigationTitle("Sessions")
    }
}
