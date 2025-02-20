//
//  RCustomizerModel+TextCustomizationStorage.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

extension RCustomizerModel {
    internal struct RCustomizerModelStorage {

        @AppStorage("lightBackgroundColor")
        var lightBackgroundColor: String = ""

        @AppStorage("darkBackgroundColor")
        var darkBackgroundColor: String = ""

        @AppStorage("lightForegroundColor")
        var lightForegroundColor: String = ""

        @AppStorage("darkForegroundColor")
        var darkForegroundColor: String = ""

        @AppStorage("fontFace")
        var fontFace: String = ""

        @AppStorage("fontSize")
        var fontSize: Double = 16.0

        @AppStorage("fontWeight")
        var fontWeight: Int = 0

        @AppStorage("lineHeight")
        var lineHeight: Double = 1.0

        @AppStorage("paragraphSpacing")
        var paragraphSpacing: Double = 1.0

        @AppStorage("kerning")
        var kerning: Double = 1.0

        @AppStorage("scheme")
        var scheme: Int = 2

        @AppStorage("preset")
        var presetId: String = RCPreset.default.id.uuidString

    }
}
