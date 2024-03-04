//
//  LibraryToolbarView.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import SwiftUI

struct LibraryToolbarView: View {

    @State
    private var library: LibraryModel = .shared

    @State
    private var view: RViewModel = .shared

    var body: some View {
        HStack(spacing: 16) {

            Button {} label: {
                Label(
                    "Settings",
                    systemImage: "gear"
                )
                .labelStyle(.iconOnly)
                .font(.caption)
                .fontWeight(.medium)
                .padding([.top, .trailing])
            }
            .buttonStyle(.plain)

            Spacer()

            Picker("", selection: $library.displayedBooks) {
                Text("History").tag(0)
                Text("Likes").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.top)

            Spacer()

            Button {} label: {
                Label(
                    "Content Language",
                    systemImage: "bubble.left.and.text.bubble.right"
                )
                .labelStyle(.iconOnly)
                .font(.caption)
                .fontWeight(.medium)
                .padding([.top, .leading])
            }
            .buttonStyle(.plain)
        }
        .safeAreaPadding(.bottom)
    }
}

#Preview {
    LibraryToolbarView()
}
