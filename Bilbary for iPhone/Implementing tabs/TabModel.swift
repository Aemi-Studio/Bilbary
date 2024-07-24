//
//  TabModel.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 24/07/24.
//

import SwiftUI

struct TabModel: Identifiable {
    private(set) var id: Tab
    var size: CGSize = .zero
    var minx: CGFloat = .zero

    enum Tab: String, CaseIterable {
        case book = "book"
        case readingTime = "hourglass"
        case customization = "textformat.size"
        case like = "heart"
        case streakGoal = "circlebadge.2"

    }
}
