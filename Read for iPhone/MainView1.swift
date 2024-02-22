//
//  ContentView.swift
//  Read for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct MainView1: View {

    @State
    private var bottomSheetShown: Bool = false

    let columns: [GridItem] = [

        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center)

    ]

    var body: some View {
        GeometryReader { geometry in

            VStack {
                Spacer()
            }

            BottomSheet(
                isOpen: self.$bottomSheetShown,
                maxHeight: geometry.size.height * 0.9
            ) {
                LazyVGrid(columns: columns) {
                    TabButtonItem(
                        title: "Book",
                        systemImage: "book"
                    )
                    TabButtonItem(
                        title: "Reading Time",
                        systemImage: "timer"
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
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView1()
}
