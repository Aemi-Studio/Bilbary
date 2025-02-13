//
//  StreakView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//

import SwiftUI

struct StreakView: View {
    
    @State private var toggleState: Bool = false
    
    var body: some View {
        
        VStack {
            // Title Section
            HStack {
                Text("3 Streak")
                    .font(.title)
                    .bold()
                Spacer()
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
