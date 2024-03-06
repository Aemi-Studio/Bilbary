//
//  RCPreset+ComputedProperties.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation
import SwiftUI

extension RCPreset {

    func foregroundColor(
        _ colorScheme: ColorScheme = ColorScheme(UITraitCollection.current.userInterfaceStyle)!
    ) -> Color {
        return switch colorScheme {
        case .light:
            self.light.foregroundColor
        case .dark:
            self.dark.foregroundColor
        @unknown default:
            self.dark.foregroundColor
        }
    }

    func backgroundColor(
        _ colorScheme: ColorScheme = ColorScheme(UITraitCollection.current.userInterfaceStyle)!
    ) -> Color {
        return switch colorScheme {
        case .light:
            self.light.backgroundColor
        case .dark:
            self.dark.backgroundColor
        @unknown default:
            self.dark.backgroundColor
        }
    }
}
