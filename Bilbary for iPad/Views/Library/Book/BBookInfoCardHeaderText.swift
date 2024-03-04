//
//  BBookInfoCardHeaderText.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardHeaderText: View {

    var title: String
    var subtitle: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            if subtitle != nil {
                Text(subtitle!)
                    .font(.headline)
                    .fontWeight(.medium)
            }
        }
    }
}
