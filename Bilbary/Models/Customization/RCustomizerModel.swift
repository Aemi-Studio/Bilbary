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

    var style: RCPreset = .default {
        didSet {
            self.storage.presetId = self.style.id.uuidString
            self.storage.lightFontColor = self.style.light.fontColor.toHex()!
            self.storage.lightBackgroundColor = self.style.light.backgroundColor.toHex()!
            self.storage.darkFontColor = self.style.dark.fontColor.toHex()!
            self.storage.darkBackgroundColor = self.style.dark.backgroundColor.toHex()!
            self.storage.fontFace = self.style.fontFace.rawValue
            self.storage.fontSize = self.style.fontSize.rawValue
            self.storage.fontWeight = self.style.fontWeight.hashValue
            self.storage.lineHeight = self.style.lineHeight
            self.storage.paragraphSpacing = self.style.paragraphSpacing
            self.storage.wordSpacing = self.style.wordSpacing
            self.storage.scheme = self.style.scheme.rawValue ?? 2
        }
    }

    var styles: [RCPreset] = RCPreset.defaults

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
            fontSize: UIContentSizeCategory(rawValue: self.storage.fontSize),
            lineHeight: self.storage.lineHeight,
            paragraphSpacing: self.storage.paragraphSpacing,
            scheme: UIUserInterfaceStyle(rawValue: self.storage.scheme)!,
            light: .init(
                type: .light,
                fontColor: .init(from: self.storage.lightFontColor)!,
                backgroundColor: .init(from: self.storage.lightBackgroundColor)!
            ),
            dark: .init(
                type: .dark,
                fontColor: .init(from: self.storage.darkFontColor)!,
                backgroundColor: .init(from: self.storage.darkBackgroundColor)!
            )
        )
    }

}
