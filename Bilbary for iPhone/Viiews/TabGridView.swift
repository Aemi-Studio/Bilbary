//
//  TabGridView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 14/07/24.
//
import SwiftUI

struct TabGridView: View {

    let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center)
    ]

    @Environment(SheetCoordinator.self)
    private var coordinator

    var body: some View {
        LazyVGrid(columns: columns) {
            TabButtonItem(
                title: "Book",
                systemImage: "book"
            ).gesture(
                dragSheetGesture(observer: coordinator)
            )
            TabButtonItem(
                title: "Reading Time",
                systemImage: "hourglass"
            ).gesture(
                dragSheetGesture(observer: coordinator)
            )
            TabButtonItem(
                title: "Like",
                systemImage: "heart"
            ).gesture(
                dragSheetGesture(observer: coordinator)
            )
            TabButtonItem(
                title: "Streak Goal",
                systemImage: "circlebadge.2"
            ).gesture(
                dragSheetGesture(observer: coordinator)
            )
            TabButtonItem(
                title: "Book",
                systemImage: "textformat.size"
            ).gesture(
                dragSheetGesture(observer: coordinator)
            )
        }
        .padding()
    }
}

func dragSheetGesture(observer: SheetCoordinator) -> some Gesture {

    DragGesture()
}
