//
//  Coordinator.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//

import Foundation

@Observable
class Coordinator {
    var sheetPhase: SheetPhases = .bottom

    enum SheetPhases {
        case bottom
        case centre
        case top
    }

    var sheetOffset: Double = 0
}
