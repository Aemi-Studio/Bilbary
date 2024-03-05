//
//  EPUBScrollableContent.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 03/03/24.
//

import SwiftUI

struct EPUBScrollableContent: View {

    @State
    private var view: BViewModel = .shared

    var book: Book

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach((book.content?.strings ?? []).prefix(10), id: \.self) { paragraph in
                        VStack {
                            Text(paragraph)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                    }
                }
                .font(.title2)
                .fontDesign(.serif)
                .frame(minHeight: 200)
                .frame(maxWidth: .infinity)
                .padding(0)
            }
            .padding(0)
        }
        .padding(.vertical, 0)
        .padding(.horizontal, 64)
        .containerRelativeFrame(
            .horizontal,
            count: 1,
            spacing: 128,
            alignment: .center
        )
    }
}
