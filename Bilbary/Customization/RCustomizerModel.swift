//
//  TextCustomizationModel.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

@Observable
final class RCustomizerModel: ObservableObject {

    static let shared: RCustomizerModel = .init()

    private let storage: RCustomizerModelStorage = .init()

    public var _colorScheme: ColorScheme? = ColorScheme(
        UITraitCollection.current.userInterfaceStyle
    )

    public var colorScheme: ColorScheme {
        get {
            self._colorScheme ?? .dark
        }

        set {
            self._colorScheme = newValue
        }
    }

    var style: RCPreset = .default {
        didSet {
            self.storage.presetId = self.style.id.uuidString
            self.storage.lightForegroundColor = self.style.light.foregroundColor.toHex()!
            self.storage.lightBackgroundColor = self.style.light.backgroundColor.toHex()!
            self.storage.darkForegroundColor = self.style.dark.foregroundColor.toHex()!
            self.storage.darkBackgroundColor = self.style.dark.backgroundColor.toHex()!
            self.storage.fontFace = self.style.fontFace.rawValue
            self.storage.fontSize = self.style.fontSize
            self.storage.fontWeight = self.style.fontWeight.hashValue
            self.storage.lineHeight = self.style.lineHeight
            self.storage.paragraphSpacing = self.style.paragraphSpacing
            self.storage.kerning = self.style.kerning
            self.storage.scheme = self.style.scheme.rawValue ?? 2
        }
    }

    var styles: [RCPreset] = RCPreset.defaults

    public var backgroundColor: Color {
        self.style.backgroundColor(self.colorScheme)
    }

    public var foregroundColor: Color {
        self.style.foregroundColor(self.colorScheme)
    }

    public var fontSize: CGFloat {
        get {
            self.style.fontSize
        }
        set {
            var preset = RCPreset(from: self.style)
            preset.fontSize = newValue
            self.save(preset)
        }
    }

    public var kerning: CGFloat {
        get {
            self.style.kerning
        }
        set {
            var preset = RCPreset(from: self.style)
            preset.kerning = newValue
            self.save(preset)
        }
    }

    public var lineHeight: CGFloat {
        get {
            self.style.lineHeight
        }
        set {
            var preset = RCPreset(from: self.style)
            preset.lineHeight = newValue
            self.save(preset)
        }
    }

    public var paragraphSpacing: CGFloat {
        get {
            self.style.paragraphSpacing
        }
        set {
            var preset = RCPreset(from: self.style)
            preset.paragraphSpacing = newValue
            self.save(preset)
        }
    }

    init() {
        if RCPreset.defaults.map({ $0.id.uuidString }).contains( self.storage.presetId ) {
            self.style = .defaults.first(where: {self.storage.presetId == $0.id.uuidString})!
        } else {
            self.style = self.generate(from: self.storage)
        }
    }

    private func generate(from storage: RCustomizerModelStorage) -> RCPreset {
        RCPreset(
            fontFace: RCFontFace(rawValue: self.storage.fontFace)!,
            fontSize: self.storage.fontSize,
            lineHeight: self.storage.lineHeight,
            paragraphSpacing: self.storage.paragraphSpacing,
            kerning: self.storage.kerning,
            scheme: UIUserInterfaceStyle(rawValue: self.storage.scheme)!,
            light: .init(
                type: .light,
                foregroundColor: .init(from: self.storage.lightForegroundColor)!,
                backgroundColor: .init(from: self.storage.lightBackgroundColor)!
            ),
            dark: .init(
                type: .dark,
                foregroundColor: .init(from: self.storage.darkForegroundColor)!,
                backgroundColor: .init(from: self.storage.darkBackgroundColor)!
            )
        )
    }

    private func save(_ style: RCPreset) {
        self.style = style
    }

}
