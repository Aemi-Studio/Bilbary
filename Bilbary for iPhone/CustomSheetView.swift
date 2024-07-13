//
//  CustomSheetView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//

import SwiftUI

struct CustomSheetView: View {
    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    @State
    private var offset: Double = UIScreen.main.bounds.height * 0.8

    @State
    private var previuosOffset: CGFloat = 0

    @State
    private var dragOffset: CGFloat = 0

    private let minHeight: CGFloat = UIScreen.main.bounds.height * 0.03
    private let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.90

    let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center)
    ]

    var body: some View {
        ZStack {
            VStack {

                LazyVGrid(columns: columns) {
                    TabButtonItem(
                        title: "Book",
                        systemImage: "book"
                    )
                    TabButtonItem(
                        title: "Reading Time",
                        systemImage: "hourglass"
                    )
                    TabButtonItem(
                        title: "Like",
                        systemImage: "heart"
                    )
                    TabButtonItem(
                        title: "Streak Goal",
                        systemImage: "circlebadge.2"
                    )
                    TabButtonItem(
                        title: "Book",
                        systemImage: "textformat.size"
                    )
                }
                .padding()

                Rectangle()

            }
        }
        .background(Material.bar)
        .cornerRadius(20.0)
        .offset(y: offset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    let delta = gesture.translation.height - previuosOffset

                    dragOffset = delta

                    let newOffset = (offset + dragOffset).clamped(to: minHeight...maxHeight)

                    self.previuosOffset = gesture.translation.height

                    withAnimation(.easeInOut(duration: 0.2)) {
                        offset = newOffset
                    }
                }
        )
    }
}
