//
//  StreakWeekRowView.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

struct StreakWeekRowView: View {

    private let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4, alignment: .center)
    ]

    
    var body: some View {
        HStack(spacing: 4) {
            LazyVGrid(columns: columns) {
                VStack(spacing: 6) { Image(systemName: "circle.fill"); Text("M") }
                VStack(spacing: 6) { Image(systemName: "circle.fill"); Text("T") }
                VStack(spacing: 6) { Image(systemName: "circle.fill"); Text("W") }
                VStack(spacing: 6) { Image(systemName: "circle"); Text("T") }
                VStack(spacing: 6) { Image(systemName: "circle"); Text("F") }
                VStack(spacing: 6) { Image(systemName: "circle"); Text("S") }
                VStack(spacing: 6) { Image(systemName: "circle"); Text("S") }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(white: 0, opacity: 0.1))
                .foregroundStyle(.clear)
        }
    }
}

#Preview {
    StreakWeekRowView()
}
