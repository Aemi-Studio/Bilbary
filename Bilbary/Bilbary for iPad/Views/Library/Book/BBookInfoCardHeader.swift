//
//  BBookInfoCardHeader.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCardHeader: View {

    var title: String
    var subtitle: String?
    var systemImage: String?

    var body: some View {
        HStack(spacing: 16) {
            BBookInfoCardHeaderImage(systemName: systemImage)
            BBookInfoCardHeaderText(title: title, subtitle: subtitle)
            Spacer()
        }
    }
}
