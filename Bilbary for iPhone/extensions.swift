//
//  extensions.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//

import Foundation

extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
