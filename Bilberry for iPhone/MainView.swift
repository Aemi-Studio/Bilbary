//
//  MainView.swift
//  Bilberry for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct MainView: View {

    @State
    private var detent: PresentationDetent = .height(64)

    @State
    private var tabBarShown: Bool = false

    let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center)
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("Book Content")
            Spacer()
        }
        //            .toolbar {
        //                ToolbarItemGroup(placement: .bottomBar) {
        //                    Button("Like", systemImage: "heart") {
        //                        print("love")
        //                    }
        //                }
        //            }
        .onTapGesture {
            tabBarShown.toggle()
        }
        .sheet(isPresented: $tabBarShown) {
            ScrollView(.vertical) {

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

                VStack(spacing: 16) {

                    VStack {
                        EmptyView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

                    ScrollView {
                        VStack {
                            HStack {
                                Text("Library")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .padding()
            }
            .scrollDisabled(true)
            .background(.black.opacity(0.5))
            .background(.ultraThinMaterial)
            .presentationDetents(
                [.height(64), .large],
                selection: $detent
            )
            .presentationBackgroundInteraction(
                .enabled(upThrough: .height(64))
            )
            .presentationDragIndicator(.hidden)
            .presentationCompactAdaptation(.automatic)
            .interactiveDismissDisabled()
        }

    }
}

#Preview {
    MainView()
}
