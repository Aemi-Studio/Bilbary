//
//  RCPreset+Equatable.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation

extension RCPreset: Equatable {
    static func == (lhs: RCPreset, rhs: RCPreset) -> Bool {
        return lhs.fontFace == rhs.fontFace &&
            lhs.fontSize == rhs.fontSize &&
            lhs.fontWeight == rhs.fontWeight &&
            lhs.lineHeight == rhs.lineHeight &&
            lhs.paragraphSpacing == rhs.paragraphSpacing &&
            lhs.kerning == rhs.kerning &&
            lhs.light == rhs.light &&
            lhs.dark == rhs.dark
    }
}
