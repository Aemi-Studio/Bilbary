//
//  MainContentView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI
import OSLog

struct ContentView: View {

    var book: Book?

    @State
    private var view: ViewModel = .shared

    private let logger: Logger = .views

    private let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .leading),
        .init(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), spacing: 0, alignment: .trailing)
    ]

    var body: some View {
        NavigationStack(path: $view.contentPath) {
            ScrollView(.horizontal) {
                VStack(spacing: 0) {
                    LazyVGrid(columns: columns) {
                        UIButton(isShown: $view.interfaceVisibility) {
                            ViewModel.shared.toggleSidebar()
                        } label: {
                            Label(
                                NSLocalizedString("Library", comment: "Library"),
                                systemImage: "books.vertical"
                            )
                            .labelStyle(.iconOnly)
                        }
                        .buttonStyle(.plain)

                        PopOver(isShown: $view.interfaceVisibility) {
                            HStack(spacing: 0) {
                                Group {
                                    Text("5 Min")
                                        .fontWeight(.bold)
                                    Text(" Read")
                                        .opacity(0.5)
                                }
                            }
                        } popover: {
                            HStack {}.frame(width: 200, height: 100)
                        }

                        PopOver(isShown: $view.interfaceVisibility) {
                            Label(
                                NSLocalizedString("Streak", comment: ""),
                                systemImage: "timer"
                            )
                        } popover: {
                            GoalStreakView()
                        }
                    }
                    VStack {

                    }
                    .padding(0)
                    LazyVGrid(columns: columns) {
                        PopOver(isShown: $view.interfaceVisibility) {
                            Label(
                                NSLocalizedString("Informations", comment: "Information about the current open book"),
                                systemImage: "book"
                            )
                            .labelStyle(.iconOnly)
                        } popover: {
                            HStack {}.frame(width: 200, height: 100)
                        }

                        UIButton(isShown: .constant(true)) {
                            logger.log("I like that.")
                        } label: {
                            Label(
                                NSLocalizedString("Like", comment: "Action of liking, in the context of the current book"),
                                systemImage: "heart"
                            )
                            .labelStyle(.iconOnly)
                        }
                        .buttonStyle(.plain)

                        PopOver(isShown: $view.interfaceVisibility) {
                            Label(
                                NSLocalizedString("Text Customization", comment: ""),
                                systemImage: "textformat.size"
                            )
                            .labelStyle(.iconOnly)
                        } popover: {
                            Customization()
                        }

                    }
                }
                .padding(100)
                .safeAreaPadding()
                .frame(minWidth: UIWindow.width)
            }
            .scrollDisabled(true)
            .onTapGesture {
                if view.libraryVisibility == .detailOnly {
                    view.interfaceVisibility.toggle()
                }
            }
            .contentShape(Rectangle())
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}
#Preview {
    ContentView(book: nil)
}
