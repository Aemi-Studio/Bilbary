//
//  LibraryView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct LibraryView: View {

    @State
    private var view: BViewModel = .shared

    @State
    private var library: LibraryModel = .shared

    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .bottomTrailing) {
                NavigationStack(path: $view.libraryPath) {
                    LibraryContentView()
                        .navigationDestination(
                            for: Book.self,
                            destination: BookInformationView.init
                        )
                        .toolbar {
                            ToolbarItemGroup(placement: .bottomBar) {
                                LibraryToolbarView()
                            }
                        }
                }
            }
            .frame(width: BConstants.libraryOpenWidth, alignment: .trailing)
            .fixedSize(horizontal: true, vertical: false)
        }
        .frame(width: view.libraryWidth, alignment: .trailing)
    }
}

#Preview {
    LibraryView()
}
