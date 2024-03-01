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
        GeometryReader { proxy in
            HStack {
                LibraryView()
                ContentView()
            }
            .frame(minWidth: view.proxy?.size.width ?? UIWindow.current?.screen.bounds.width)
            .frame(maxWidth: view.proxy?.size.width ?? UIWindow.current?.screen.bounds.width)
            .onAppear {
                view.proxy = proxy
            }
        }
        .preference(key: ScreenWidthKey.self, value: self.view.screenWidth)
        .onPreferenceChange(ScreenWidthKey.self) { value in
            self.view.screenWidth = value
        }
        .sheet(isPresented: $view.displayOnboarding) {
            OnePageOnboardingView()
        }
    }
}

#Preview {
    BilbaryView()
}
