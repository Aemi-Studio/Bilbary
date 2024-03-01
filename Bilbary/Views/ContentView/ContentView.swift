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
    private var view: RViewModel = .shared

    private let logger: Logger = .views

    var body: some View {
        NavigationStack(path: $view.contentPath) {
            ScrollView(.horizontal) {
                VStack(spacing: 0) {
                    TopBar()
                    EPUBView()
                    BottomBar()
                }
                .padding(100)
                .safeAreaPadding()
                .frame(minWidth: view.proxy?.size.width ?? UIWindow.current?.screen.bounds.width)
                .frame(maxWidth: view.proxy?.size.width ?? UIWindow.current?.screen.bounds.width)
            }
            .scrollDisabled(true)
            .onTapGesture {
                withAnimation {
                    if !view.libraryVisibility {
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
