//
//  RCPreset.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 23/02/24.
//

import SwiftUI

struct RCPreset: Identifiable, Equatable, Hashable {

    static func == (lhs: RCPreset, rhs: RCPreset) -> Bool {
        return lhs.fontFace == rhs.fontFace &&
            lhs.fontSize == rhs.fontSize &&
            lhs.fontWeight == rhs.fontWeight &&
            lhs.lineHeight == rhs.lineHeight &&
            lhs.paragraphSpacing == rhs.paragraphSpacing &&
            lhs.wordSpacing == rhs.wordSpacing &&
            lhs.light == rhs.light &&
            lhs.dark == rhs.dark
    }

    @Environment(\.colorScheme)
    private var colorScheme: ColorScheme

    /// Makes it usable in ForEach SwiftUI loops
    private(set) var id: UUID = .init()
    var fontFace: RCFontFace = .default
    var fontSize: UIContentSizeCategory = .medium
    var fontWeight: Font.Weight = .regular
    var lineHeight: CGFloat = 1.0
    var paragraphSpacing: CGFloat = 1.0
    var wordSpacing: CGFloat = 1.0
    var scheme: UIUserInterfaceStyle = .dark
    var light: RCScheme = .init(
        fontColor: .black,
        backgroundColor: .white
    )
    var dark: RCScheme = .init(
        fontColor: .white,
        backgroundColor: .black
    )

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

extension RCPreset {
    static let quiet: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000001")!,
        fontFace: .georgia,
        light: .init(
            type: .light,
            fontColor: Color(red: 0.667, green: 0.667, blue: 0.698),
            backgroundColor: .init(red: 0.29, green: 0.286, blue: 0.306)
        ),
        dark: .init(
            type: .dark,
            fontColor: Color(red: 0.553, green: 0.545, blue: 0.573),
            backgroundColor: .black
        )
    )
    static let paper: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000002")!,
        fontFace: .charter,
        light: .init(
            type: .light,
            fontColor: Color(red: 0.129, green: 0.11, blue: 0.114),
            backgroundColor: .init(red: 0.929, green: 0.929, blue: 0.929)
        ),
        dark: .init(
            type: .dark,
            fontColor: Color(red: 0.949, green: 0.949, blue: 0.937),
            backgroundColor: Color(red: 0.11, green: 0.11, blue: 0.118)
        )
    )
    static let bold: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000003")!,
        fontFace: .default,
        light: .init(
            type: .light,
            fontColor: Color(red: 0.11, green: 0.11, blue: 0.118),
            backgroundColor: .init(red: 1, green: 1, blue: 1)
        ),
        dark: .init(
            type: .dark,
            fontColor: Color(red: 0.11, green: 0.11, blue: 0.118),
            backgroundColor: Color(red: 0, green: 0, blue: 0)
        )
    )
    static let calm: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000004")!,
        fontFace: .palatino,
        light: .init(
            type: .light,
            fontColor: Color(red: 0.216, green: 0.173, blue: 0.141),
            backgroundColor: .init(red: 0.945, green: 0.882, blue: 0.78)
        ),
        dark: .init(
            type: .dark,
            fontColor: Color(red: 0.969, green: 0.925, blue: 0.851),
            backgroundColor: Color(red: 0.263, green: 0.231, blue: 0.188)
        )
    )
    static let focus: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000005")!,
        fontFace: .avenir,
        light: .init(
            type: .light,
            fontColor: .init(red: 0.078, green: 0.071, blue: 0.008),
            backgroundColor: .init(red: 1, green: 0.988, blue: 0.957)
        ),
        dark: .init(
            type: .dark,
            fontColor: .init(red: 1, green: 0.976, blue: 0.925),
            backgroundColor: .init(red: 0.102, green: 0.086, blue: 0.047)
        )
    )
    static let `default`: Self = .init(
        id: .init(uuidString: "00000000-0000-0000-0000-000000000000")!
    )
    static let defaults: [Self] = [
        .default,
        .bold,
        .calm,
        .focus,
        .paper,
        .quiet
    ]
}

extension RCPreset {

    var fontColor: Color {
        return switch UITraitCollection.current.userInterfaceStyle {
        case .light:
            self.light.fontColor
        case .dark:
            self.dark.fontColor
        case .unspecified:
            self.light.fontColor
        @unknown default:
            self.light.fontColor
        }
    }

    var backgroundColor: Color {
        return switch UITraitCollection.current.userInterfaceStyle {
        case .light:
            self.light.backgroundColor
        case .dark:
            self.dark.backgroundColor
        case .unspecified:
            self.light.backgroundColor
        @unknown default:
            self.light.backgroundColor
        }
    }
}
