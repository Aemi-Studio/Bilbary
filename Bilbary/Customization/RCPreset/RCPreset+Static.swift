//
//  RCPreset+Static.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation
import SwiftUI

extension RCPreset {
    static let quiet: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000001")!,
        fontFace: .publico,
        light: .init(
            type: .light,
            foregroundColor: Color(red: 0.92, green: 0.92, blue: 0.96),
            backgroundColor: .init(red: 0.29, green: 0.29, blue: 0.30)
        ),
        dark: .init(
            type: .dark,
            foregroundColor: Color(red: 0.55, green: 0.55, blue: 0.58),
            backgroundColor: .black
        )
    )
    static let paper: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000002")!,
        fontFace: .charter,
        light: .init(
            type: .light,
            foregroundColor: Color(red: 0.129, green: 0.11, blue: 0.114),
            backgroundColor: .init(red: 0.929, green: 0.929, blue: 0.929)
        ),
        dark: .init(
            type: .dark,
            foregroundColor: Color(red: 0.949, green: 0.949, blue: 0.937),
            backgroundColor: Color(red: 0.11, green: 0.11, blue: 0.118)
        )
    )
    static let bold: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000003")!,
        fontFace: .default,
        light: .init(
            type: .light,
            foregroundColor: Color(red: 0.11, green: 0.11, blue: 0.118),
            backgroundColor: .init(red: 1, green: 1, blue: 1)
        ),
        dark: .init(
            type: .dark,
            foregroundColor: Color(red: 0.11, green: 0.11, blue: 0.118),
            backgroundColor: Color(red: 0, green: 0, blue: 0)
        )
    )
    static let calm: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000004")!,
        fontFace: .palatino,
        light: .init(
            type: .light,
            foregroundColor: Color(red: 0.216, green: 0.173, blue: 0.141),
            backgroundColor: .init(red: 0.945, green: 0.882, blue: 0.78)
        ),
        dark: .init(
            type: .dark,
            foregroundColor: Color(red: 0.969, green: 0.925, blue: 0.851),
            backgroundColor: Color(red: 0.263, green: 0.231, blue: 0.188)
        )
    )
    static let focus: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000005")!,
        fontFace: .avenir,
        light: .init(
            type: .light,
            foregroundColor: .init(red: 0.078, green: 0.071, blue: 0.008),
            backgroundColor: .init(red: 1, green: 0.988, blue: 0.957)
        ),
        dark: .init(
            type: .dark,
            foregroundColor: .init(red: 1, green: 0.976, blue: 0.925),
            backgroundColor: .init(red: 0.102, green: 0.086, blue: 0.047)
        )
    )

    static let `default`: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000000")!
    )

    static let defaults: [Self] = [
        RCPreset.default,
        RCPreset.bold,
        RCPreset.calm,
        RCPreset.focus,
        RCPreset.paper,
        RCPreset.quiet
    ]
}
