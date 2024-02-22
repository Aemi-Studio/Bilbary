//
//  ScreenWidthKey.swift
//  Read
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

struct ScreenWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
