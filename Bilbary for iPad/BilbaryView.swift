//
//  BilbaryView.swift
//  iits
//
//  Created by Guillaume Coquard on 13/02/24.
//

import SwiftUI
import OSLog

struct BilbaryView: View {

    @State
    private var view: RViewModel = .shared

    var body: some View {
        HStack(spacing: 0) {
            LibraryView()
            Divider()
                .padding(0)
                .opacity(view.isLibraryOpen ? 1 : 0)
            ContentView()
        }
        .padding(0)
        .ignoresSafeArea()
        .orientationUpdatesScreen()
        .sheet(isPresented: $view.displayOnboarding) {
            OnboardingView()
        }

    }
}

#Preview {
    BilbaryView()
}
