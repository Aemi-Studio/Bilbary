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

        @AppStorage("lightFontColor")
        var lightFontColor: String = ""

        @AppStorage("darkFontColor")
        var darkFontColor: String = ""

        @AppStorage("fontFace")
        var fontFace: String = ""

        @AppStorage("fontSize")
        var fontSize: String = ""

        @AppStorage("fontWeight")
        var fontWeight: Int = 0

        @AppStorage("lineHeight")
        var lineHeight: Double = 1.0

        @AppStorage("paragraphSpacing")
        var paragraphSpacing: Double = 1.0

        @AppStorage("wordSpacing")
        var wordSpacing: Double = 1.0

        @AppStorage("scheme")
        var scheme: Int = 2

        @AppStorage("preset")
        var presetId: String = RCPreset.default.id.uuidString

    }
}
