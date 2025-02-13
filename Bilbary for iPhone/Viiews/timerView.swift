//
//  timerView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 10/07/24.
//

import SwiftUI

struct TimerView: View {
    @State
    private var timeSpent: TimeInterval?
    
    var body: some View {
        VStack {
            if let timeSpent = timeSpent {
                VStack {
                    Text("This View For Content Length")
                        .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
