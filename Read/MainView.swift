//
//  MainView.swift
//  iits
//
//  Created by Guillaume Coquard on 13/02/24.
//

import SwiftUI
import OSLog

struct MainView: View {

    @State
    private var view: ViewModel = .shared

    var body: some View {
        GeometryReader { proxy in
            NavigationSplitView(columnVisibility: $view.libraryVisibility) {
                LibraryView()
            } detail: {
                ContentView()
            }
            .navigationSplitViewStyle(.balanced)
            .onAppear {
                self.view.screenWidth = proxy.size.width
            }
        }
        .preference(key: ScreenWidthKey.self, value: self.view.screenWidth)
        .onPreferenceChange(ScreenWidthKey.self) { value in
            self.view.screenWidth = value
        }
    }
}

#Preview {
    MainView()
}
