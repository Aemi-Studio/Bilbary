//
//  TextCustomization.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

struct Customization: View {

    @State
    private var customization: CustomizationModel = .shared

    var body: some View {
        VStack {
            DisclosureGroup("Color") {
                Picker(
                    NSLocalizedString("customization.colorPicker", comment: "Custom Color in the Picker"),
                    selection: self.$customization.backgroundColor
                ) {
                    ForEach(CustomColor.allCases, id: \.self) { color in
                        Text(color.rawValue).tag(color.rawValue)
                    }
                }
            }

            DisclosureGroup("Text") {
                Picker(
                    NSLocalizedString("customization.fontPicker", comment: "Custom Font in the Picker"),
                    selection: self.$customization.fontFace
                ) {
                    ForEach(CustomFontFace.allCases, id: \.self) { face in
                        Text(face.rawValue).tag(face.rawValue)
                    }
                }
            }
        }
        .frame(minWidth: 200)
        .padding()
    }
}

#Preview {
    Customization()
}
