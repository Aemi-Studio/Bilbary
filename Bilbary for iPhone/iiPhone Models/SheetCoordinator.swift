//
//  Coordinator.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//

import SwiftUI

@Observable
class SheetCoordinator {
    var sheetPhase: SheetPhases = .bottom

    enum SheetPhases {
        case bottom
        case centre
        case top
    }

    var tabBarShown: Bool = false
    var sheetOffset: Double = 0

    var offset: Double = UIScreen.main.bounds.height * 1.1
    var offsetAnchor: CGFloat?

    var deltaOffset: CGFloat = 0
    var dragOffset: CGFloat = 0

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    let minHeight: CGFloat = UIScreen.main.bounds.height * 0.03
    let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.85
    let heightFactor: Double = 0.8

}
