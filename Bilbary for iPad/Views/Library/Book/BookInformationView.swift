//
//  BookInformationView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

// swiftlint:disable line_length
struct BookInformationView: View {

    @Environment(\.dismiss)
    private var dismiss: DismissAction

    @State
    private var view: RViewModel = .shared

    @State
    private var size: CGFloat?

    var book: Book

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                BBookInfoCardMain(book: book)
                BBookInfoProgressCard(book: book)
                BBookInfoCard(
                    title: "Victor Hugo",
                    subtitle: "1802 - 1885",
                    systemImage: "person.fill"
                )
                BBookInfoCard(
                    title: "Odes & Ballades",
                    subtitle: "1802 - 1885",
                    content: "\"Le Géant\" is a poem by Victor Hugo in which the speaker is a giant, metaphorically representing great individual power. The giant recounts his life of strength and adventure, from his upbringing in harsh environments, through bouts with nature's elements and beasts, to his enjoyment of warfare. He proudly describes his ability to wield power without any armored protection. In the end, he acknowledges the inevitability of his own death and expresses a wish to be buried among majestic mountains so sublime that people will wonder which one serves as his tomb."
                )

                BBookInfoCard(
                    title: "Odes & Ballades",
                    subtitle: "1802 - 1885",
                    content: "\"Le Géant\" is a poem by Victor Hugo in which the speaker is a giant, metaphorically representing great individual power. The giant recounts his life of strength and adventure, from his upbringing in harsh environments, through bouts with nature's elements and beasts, to his enjoyment of warfare. He proudly describes his ability to wield power without any armored protection. In the end, he acknowledges the inevitability of his own death and expresses a wish to be buried among majestic mountains so sublime that people will wonder which one serves as his tomb."
                )
            }
        }
        .padding(.horizontal)
        .frame(minWidth: BConstants.libraryOpenWidth)
        .frame(maxWidth: BConstants.libraryOpenWidth)
        .fixedSize(horizontal: true, vertical: false)
        .toolbar {
            ToolbarItemGroup(placement: .confirmationAction) {
                Text("1")
                    .fontWeight(.bold)
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
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
// swiftlint:enable line_length
