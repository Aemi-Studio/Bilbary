//
//  RCPreset.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 23/02/24.
//

import SwiftUI

struct RCPreset: Identifiable {

    @Environment(\.colorScheme)
    private var colorScheme: ColorScheme

    /// Makes it usable in ForEach SwiftUI loops
    private(set) var id: UUID
    var fontFace: RCFontFace
    var fontSize: CGFloat
    var fontWeight: Font.Weight
    var lineHeight: CGFloat
    var paragraphSpacing: CGFloat
    var kerning: CGFloat
    var scheme: UIUserInterfaceStyle
    var light: RCScheme
    var dark: RCScheme

    init(
        id: UUID = UUID(),
        fontFace: RCFontFace? = nil,
        fontSize: CGFloat? = nil,
        fontWeight: Font.Weight? = nil,
        lineHeight: CGFloat? = nil,
        paragraphSpacing: CGFloat? = nil,
        kerning: CGFloat? = nil,
        scheme: UIUserInterfaceStyle? = nil,
        light: RCScheme? = nil,
        dark: RCScheme? = nil
    ) {
        self.id = id
        self.fontFace = fontFace ?? .default
        self.fontSize = fontSize ?? 16.0
        self.fontWeight = fontWeight ?? .regular
        self.lineHeight = lineHeight ?? 1.0
        self.paragraphSpacing = paragraphSpacing ?? 1.0
        self.kerning = kerning ?? 1.0
        self.scheme = scheme ?? .dark
        self.light = light ?? .init(
            type: .light,
            foregroundColor: .foreground,
            backgroundColor: .background
        )
        self.dark = dark ?? .init(
            type: .dark,
            foregroundColor: .foreground,
            backgroundColor: .background
        )
    }

    init(from preset: Self) {
        self.init(
            id: UUID(),
            fontFace: preset.fontFace,
            fontSize: preset.fontSize,
            fontWeight: preset.fontWeight,
            lineHeight: preset.lineHeight,
            paragraphSpacing: preset.paragraphSpacing,
            kerning: preset.kerning,
            scheme: preset.scheme,
            light: preset.light,
            dark: preset.dark
        )
    }
}

extension RCPreset {

    func present(
        _ text: String,
        _ colorScheme: ColorScheme = ColorScheme(UITraitCollection.current.userInterfaceStyle)!
    ) -> AttributedString {
        var string = AttributedString(text)
        string.foregroundColor = self.foregroundColor(colorScheme)
        string.font = .custom(
            self.fontFace.rawValue,
            size: self.fontSize,
            relativeTo: .body
        )
        string.kern = self.kerning
        return string
    }
}
