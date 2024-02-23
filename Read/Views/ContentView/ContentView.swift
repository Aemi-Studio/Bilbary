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

    var body: some View {
        NavigationStack(path: $view.contentPath) {
            ScrollView(.horizontal) {
                VStack(spacing: 0) {
                    TopBar()
                    VStack {
                        ScrollView {
                            BookView(book: book)
                        }
                    }
                    .padding(0)
                    BottomBar()
                }
                .padding(100)
                .safeAreaPadding()
                .frame(minWidth: self.view.screenWidth)
            }
            .scrollDisabled(true)
            .onTapGesture {
                withAnimation {
                    if view.libraryVisibility == .detailOnly {
                        logger.info("\(String(describing: view.isAnyPopoverDisplayed))")
                        logger.info("\(String(describing: view.activePopover))")
                        if !view.isAnyPopoverDisplayed {
                            view.interfaceVisibility.toggle()
                        }
                    } else {
                        view.libraryVisibility.toggle()
                    }
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
