//
//  NavigationSplitViewVisibility.swift
//  Read
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

extension NavigationSplitViewVisibility {
    public mutating func toggle() {
        if self == .detailOnly {
            self = .doubleColumn
        } else {
            self = .detailOnly
        }
    }
}
