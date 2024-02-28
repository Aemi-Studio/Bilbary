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

    var book: Book?

    var body: some View {
        ScrollView {

            VStack {
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

                GenericInfoCard(onTap: {}, title: "1 h 32 min", subTitle: "Started on 23th Jan, 2024", contentText: "", nameImage: "square.and.arrow.up.circle.fill", number: 74)

                GenericInfoCard(onTap: {}, title: "Victor Hugo", subTitle: "1802 - 1885", contentText: "", nameImage: "person.fill", number: 0)

                GenericInfoCard(onTap: {}, title: "Odes & Ballades", subTitle: "1802 - 1885", contentText: "\"Le Géant\" is a poem by Victor Hugo in which the speaker is a giant, metaphorically representing great individual power. The giant recounts his life of strength and adventure, from his upbringing in harsh environments, through bouts with nature's elements and beasts, to his enjoyment of warfare. He proudly describes his ability to wield power without any armored protection. In the end, he acknowledges the inevitability of his own death and expresses a wish to be buried among majestic mountains so sublime that people will wonder which one serves as his tomb.", nameImage: "book.closed.fill", number: 0)

                GenericInfoCard(onTap: {}, title: "Odes & Ballades", subTitle: "1802 - 1885", contentText: "\"Le Géant\" is a poem by Victor Hugo in which the speaker is a giant, metaphorically representing great individual power. The giant recounts his life of strength and adventure, from his upbringing in harsh environments, through bouts with nature's elements and beasts, to his enjoyment of warfare. He proudly describes his ability to wield power without any armored protection. In the end, he acknowledges the inevitability of his own death and expresses a wish to be buried among majestic mountains so sublime that people will wonder which one serves as his tomb.", nameImage: "person.fill", number: 0)

                Text("")
            }
            .padding(.horizontal, 30)
        }
    }
}
// swiftlint:enable line_length

#Preview {
    BookInformationView()
        .background(Color.black)
}
