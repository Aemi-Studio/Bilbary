//
//  ContainerView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//
//
import SwiftUI

struct ContainerView: View {
    let timeSpent: TimeInterval?
    let sessionsCount: Int
    
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
                            
                            Text("\(sessionsCount) sessions")
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
