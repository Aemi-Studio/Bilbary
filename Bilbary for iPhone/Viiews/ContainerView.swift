//
//  ContainerView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//

import SwiftUI
import _SwiftData_SwiftUI

struct ContainerView: View {
    private var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()
    
    @State
    private var timeSpent: TimeInterval?
    
    @Query
    private var sessions: [ReadSession]
    
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                EmptyView()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.bar)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            ScrollView {
                VStack {
                    if let timeSpent = timeSpent {
                        VStack {
                            Text(timeSpent, format: .number.rounded(rule: .toNearestOrEven, increment: 1))
                                .padding()
                            
                            Text("\(sessions.count) sessions")
                                .padding()
                        }
                    }
                    
                    HStack {
                        Text("Library")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
