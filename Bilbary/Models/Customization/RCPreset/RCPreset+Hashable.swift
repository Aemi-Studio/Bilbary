//
//  RCPreset+Hashable.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation

extension RCPreset: Hashable {
    /// Validate `Hashable` conformance
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.fontFace)
        hasher.combine(self.fontSize)
        hasher.combine(self.fontWeight)
        hasher.combine(self.lineHeight)
        hasher.combine(self.paragraphSpacing)
        hasher.combine(self.scheme)
        hasher.combine(self.light)
        hasher.combine(self.dark)
    }
}
