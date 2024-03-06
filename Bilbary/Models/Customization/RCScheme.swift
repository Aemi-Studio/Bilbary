//
//  RCScheme.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 23/02/24.
//

import SwiftUI

struct RCScheme: Equatable, Hashable {
    var type: ColorScheme = .dark
    var foregroundColor: Color = .userDefinedForeground
    var backgroundColor: Color = .userDefinedForeground
}
