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

    @State
    private var viewOption = 0

    @State
    private var libraryPath: [Any] = []

    private var placeholder: String = ""

    @State
    private var previewText = " "

    @State
    private var searchText = ""

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationStack(path: $view.libraryPath) {
            ScrollView(.horizontal) {
                ZStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Text("Library")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }

                        HStack {
                            TextField("Placeholder", text: $searchText)
                                .padding(.leading, 30)
                                .overlay(
                                    HStack {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(.gray)
                                            .padding(.leading, 8)
                                        Spacer()

                                        if searchText.isEmpty {
                                            Image(systemName: "mic.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                        } else {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundColor(.gray)
                                                .padding(.trailing, 8)
                                                .onTapGesture {
                                                    withAnimation {
                                                        self.searchText = ""
                                                    }
                                                }
                                        }
                                    }
                                )
                                .foregroundColor(.primary)
                                .padding(10)
                                .background(Color(.systemGray3))
                                .cornerRadius(8)
                        }
                        .padding()
                        .background(colorScheme == .dark ? Color.black : Color.white)

                        ScrollView {
                            VStack(alignment: .leading) {
                                Text("Today")
                                    .font(.system(size: 14, weight: .semibold))
                                VStack(spacing: 0) {
                                    ForEach(0..<15, id: \.self) { _ in
                                        LibraryBookCard(onTap: {
                                            view.libraryPath.append(BookPlaceholder(from: nil))
                                        }, number: Int.random(in: 0..<100))
                                        .padding(.all, 7)
                                    }
                                }
                            }
                        }
                    }
                    .padding(0)
                    .safeAreaPadding()
                    .frame(width: BConstants.libraryOpenWidth)
                    .navigationTitle("Library")
                    .navigationBarTitleDisplayMode(.large)
                    .toolbar(.hidden, for: .navigationBar)
                    .navigationDestination(for: BookPlaceholder.self, destination: BookInformationView.init)

                    CustomHStack(viewOption: $viewOption)
                }
                .onTapGesture {
                    withAnimation {
                        if view.libraryVisibility {
                            view.libraryVisibility.toggle()
                        }
                    }
                }
            }
            .contentShape(Rectangle())
            .toolbar(.hidden, for: .navigationBar)
            .searchable(text: $searchText)
        }
        .scrollDisabled(true)
        .frame(width: view.libraryWidth) // Dynamically adjust the width
    }
}

#Preview {
    LibraryView()
}
