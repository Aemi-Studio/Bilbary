//
//  BookInfoCardGeneric.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI

struct BBookInfoCard: View {

    var title: String
    var subtitle: String?
    var systemImage: String?
    var content: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            BBookInfoCardHeader(
                title: title,
                subtitle: subtitle,
                systemImage: systemImage
            )
            if content != nil {
                Text(content!)
                    .multilineTextAlignment(.leading)
            }
        }
        .cardStyle()
    }
}
