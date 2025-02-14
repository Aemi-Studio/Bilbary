//
//  CustomizationView.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 13/02/25.
//

import SwiftUI

struct CustomizationView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Customization View")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.bar)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            ScrollView {
               
            }
        }
    }
}

#Preview {
    CustomizationView()
}
