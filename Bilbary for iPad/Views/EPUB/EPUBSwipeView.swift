//
//  EPUBSwipeView.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import SwiftUI

struct EPUBSwipeView: View {

    @State
    private var view: BViewModel = .shared

    @State
    private var readModel: BReadModel = .shared

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(readModel.selectedBooks, id: \.self) { book in
                    EPUBScrollableContent(book: book)
                        .id( book.id )
                }
            }
            .scrollTargetLayout()
        }
        .scrollDisabled(view.isAnyPopoverDisplayed)
        .scrollPosition(id: $readModel.selectedBook, anchor: .center)
        .scrollClipDisabled()
        .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
        .scrollIndicators(.never)
        .contentMargins(.horizontal, 0)
        .padding(0)
        .padding(.horizontal, 64)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(minWidth: view.screenWidth)
        .frame(width: view.screenWidth)
        .frame(maxWidth: view.screenWidth)
    }
}

#Preview {
    EPUBSwipeView()
}
