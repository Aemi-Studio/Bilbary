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
        case research = "Research"
        case developmnet = "Development"
        case analytics = "Analytics"
        case audience = "Audience"
        case privacy = "Privacy"
    }
}
