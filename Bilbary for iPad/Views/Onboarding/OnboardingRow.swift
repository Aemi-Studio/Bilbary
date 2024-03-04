//
//  OnboardingRow.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct OnboardingRow: View {

    var title: String
    var subtitle: String
    var systemName: String

    var body: some View {
        HStack(spacing: 18) {
            VStack {
                Image(systemName: systemName)
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .fontWeight(.regular)
            }
            .padding(.vertical)

            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                    .font(.title2)

                Text(subtitle)
                    .font(.title3)
                    .foregroundColor(.secondary)

            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
    }
}
