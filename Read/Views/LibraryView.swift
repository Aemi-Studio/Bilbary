//
//  LibraryView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct LibraryView: View {

    @State
    private var view: RViewModel = .shared

    var body: some View {
        NavigationStack(path: $view.libraryPath) {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text("Library")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                Button("Book", systemImage: "book") {
                    view.libraryPath.append(Book())
                }
                Spacer()
            }
            .padding(0)
            .safeAreaPadding()
            .frame(minWidth: 300)
            .navigationTitle("Library")
            .navigationBarTitleDisplayMode(.large)
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: Book.self, destination: BookInformationView.init)
        }
    }
}

#Preview {
    LibraryView()
}
