//
//  BBookInfoCardHeaderImage.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardHeaderImage: View {

    var systemName: String?

    var body: some View {
        Group {
            if systemName == nil {
                EmptyView()
            } else {
                ZStack {
                    Image(systemName: "circle")
                        .foregroundStyle(.clear)
                }
                .overlay {
                    Image(systemName: systemName!)
                }
                .font(.title2)
                .cardHeaderImageStyle()
            }
        }
    }
}
