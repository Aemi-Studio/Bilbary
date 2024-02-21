//
//  TextCustomizationModel.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

@Observable
final class CustomizationModel: ObservableObject {

    static let shared: CustomizationModel = .init()

    private let storage: CustomizationModelStorage = .init()

    var backgroundColor: String = "black" {
        didSet {
            self.storage.backgroundColor = self.backgroundColor
        }
    }

    var fontFace: String = "Georgia" {
        didSet {
            self.storage.fontFace = self.fontFace
        }
    }

    var fontSize: String = "xLarge" {
        didSet {
            self.storage.fontSize = self.fontSize
        }
    }

    var lineHeight: Double = 1.0 {
        didSet {
            self.storage.lineHeight = self.lineHeight
        }
    }

    var paragraphSpacing: Double = 1.0 {
        didSet {
            self.storage.paragraphSpacing = self.paragraphSpacing
        }
    }

    init() {
        self.backgroundColor = self.storage.backgroundColor
        self.fontFace = self.storage.fontFace
        self.fontSize = self.storage.fontSize
        self.lineHeight = self.storage.lineHeight
        self.paragraphSpacing = self.storage.paragraphSpacing
    }

    func getBackgroundColor() -> Color? {
        CustomColor(rawValue: self.backgroundColor)?.asColor
    }

}
