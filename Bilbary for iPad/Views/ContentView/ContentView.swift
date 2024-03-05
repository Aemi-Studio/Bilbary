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
    private var view: BViewModel = .shared

    private let logger: Logger = .views

    var body: some View {
        ScrollView(.horizontal) {
            NavigationStack(path: $view.contentPath) {
                VStack(spacing: 0) {
                    TopBar()
                        .padding(.horizontal, 74)
                    EPUBView()
                    BottomBar()
                        .padding(.horizontal, 74)
                }
                .padding(.vertical, 64)
                .safeAreaPadding()
                .frame(minWidth: view.screenWidth)
                .frame(maxWidth: view.screenWidth)
                .toolbar(.hidden, for: .navigationBar)
                .toolbar(.hidden, for: .tabBar)
                .toolbar(.hidden, for: .bottomBar)
            }
            .frame(minWidth: view.screenWidth)
            .frame(maxWidth: view.screenWidth)
            .fixedSize(horizontal: true, vertical: false)
        }
        .safeAreaPadding()
        .scrollDisabled(true)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                if !view.isAnyPopoverDisplayed {
                    view.isInterfaceVisible.toggle()
                } else
                if view.isLibraryOpen {
                    view.toggleLibrary()
                }
            }
        }
    }
}

#Preview {
    ContentView(book: nil)
}
