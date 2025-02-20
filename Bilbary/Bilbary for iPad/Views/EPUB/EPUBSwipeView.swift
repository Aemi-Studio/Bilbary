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
                ForEach(readModel.selectedBooks) { book in
                    EPUBScrollableContent(book: book)
                        .id( book.hashValue )
                }
            }
            .scrollTargetLayout()
        }
        .scrollDisabled(view.isAnyPopoverDisplayed)
        .scrollPosition(id: $readModel.selectedBookHashValue, anchor: .trailing)
        .scrollClipDisabled()
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.never)
        .contentMargins(.horizontal, 0)
        .padding(0)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(minWidth: view.screenWidth)
        .frame(width: view.screenWidth)
        .frame(maxWidth: view.screenWidth)
    }
}

#Preview {
    EPUBSwipeView()
}
