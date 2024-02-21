//
//  BookInformationView.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct BookInformationView: View {

    @Environment(\.dismiss)
    private var dismiss: DismissAction

    var book: Book?

    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Button("Library", systemImage: "chevron.backward") {
                    dismiss()
                }
                Spacer()
            }
            ScrollView(.vertical) {
                VStack {
                    Spacer()
                    Text("Book information")
                    Spacer()

                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .padding()
    }
}

#Preview {
    BookInformationView()
}
