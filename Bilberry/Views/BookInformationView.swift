//
//  BookInformationView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct BookInformationView: View {

    @Environment(\.dismiss)
    private var dismiss: DismissAction

    var book: Book?

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 16) {

                HStack {
                    Text("Library")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }

                HStack {
                    CustomButton(action: {}, nameImage: "heart.fill", text: "Like")
                    Spacer()
                    CustomButton(action: {}, nameImage: "infinity.circle", text: "")
                    CustomButton(action: {}, nameImage: "square.split.diagonal.2x2.fill", text: "")
                }
            }
        }
    }
}

#Preview {
    BookInformationView()
}
