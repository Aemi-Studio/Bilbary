//
//  +TextCustomizationStorage.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

extension CustomizationModel {
    internal struct CustomizationModelStorage {

        @AppStorage("backgroundColor")
        var backgroundColor: String = "black"

        @AppStorage("fontFace")
        var fontFace: String = "Georgia"

        @AppStorage("fontSize")
        var fontSize: String = "xLarge"

        @AppStorage("lineHeight")
        var lineHeight: Double = 1.0

        @AppStorage("paragraphSpacing")
        var paragraphSpacing: Double = 1.0

        @AppStorage("wordSpacing")
        var wordSpacing: Double = 1.0

    }
}
