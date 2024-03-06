//
//  TopBar.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

struct TopBar: View {

    @State
    private var view: BViewModel = .shared

    var body: some View {

        RBarRow {
            RButton(
                isShown: $view.isInterfaceVisible,
                title: NSLocalizedString(
                    "Library",
                    comment: "Library"
                ),
                systemImage: "books.vertical",
                systemImageActive: "books.vertical.fill",
                linkedTo: .library
            ) {
                view.toggleLibrary()
            }
        } center: {
            RReadingTimeMenu()
        } trailing: {
            BStreakPopover()
        }
    }
}

#Preview {
    TopBar()
}
