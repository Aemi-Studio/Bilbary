//
//  GenericInfoCard.swift
//  Read for iPad & macOS
//
//  Created by Luca Gargiulo on 26/02/24.
//

import SwiftUI

struct GenericInfoCard: View {
    let onTap: () -> Void

    var title: String
    var subTitle: String
    var contentText: String
    var nameImage: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: nameImage)

                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                    Text(subTitle)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                }
                Spacer()
            }
            Text(contentText)
                .padding(.top, 10)
        }
        .padding(14)
        .background(.quaternary)
        .cornerRadius(12)
        .padding([.horizontal, .vertical])
        .onTapGesture {
            onTap()
        }
    }

}

// PreviewProvider
struct GenericInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        GenericInfoCard(onTap: {
        }, title: "title", subTitle: "subTitle", contentText: "This is a test content", nameImage: "heart")
        .previewLayout(.sizeThatFits)
        .background(Color.gray.opacity(0.3))
    }
}
