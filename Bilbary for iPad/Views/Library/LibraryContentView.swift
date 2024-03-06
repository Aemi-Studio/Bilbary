//
//  LibraryContentView.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 02/03/24.
//

import SwiftUI

struct LibraryContentView: View {

    @State
    private var view: BViewModel = .shared

    @State
    private var customizer: RCustomizerModel = .shared

    @State
    private var library: LibraryModel = .shared

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 16) {
                Section("Today") {
                    ForEach(library.openedBooks) { book in
                        LibraryBookCard(book: book)
                            .onTapGesture {
                                view.libraryPath.append(book)
                            }
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Library")
        .navigationBarTitleDisplayMode(.automatic)
        .searchable(text: $library.searchText)
    }
}

#Preview {
    LibraryContentView()
}
