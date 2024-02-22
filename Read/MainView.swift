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
        NavigationSplitView(columnVisibility: $view.libraryVisibility) {
            LibraryView()
        } detail: {
            ContentView()
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    MainView()
}
