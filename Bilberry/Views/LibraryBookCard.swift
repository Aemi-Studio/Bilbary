//
//  libraryBookCard.swift
//  Bilberry for iPad & macOS
//
//  Created by Mikayla Kim on 22/02/24.
//

import SwiftUI

struct LibraryBookCard: View {
    let onTap: () -> Void

    var number: Int

    var body: some View {

        HStack {
            NumberCircle(number: number, maxNumber: 100, circleSize: 40, strokeWidth: 4, fontSize: 15)

            VStack(alignment: .leading) {
                Text("The Giant in Glee.")
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                Text("Victor Hugo")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
            }
            Spacer()

            Image(systemName: "heart")
                .font(.system(size: 20))
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
struct LibraryBookCard_Previews: PreviewProvider {
    static var previews: some View {
        LibraryBookCard(onTap: {
        }, number: 100)
        .previewLayout(.sizeThatFits)
        .background(Color.gray.opacity(0.3))
    }
}
