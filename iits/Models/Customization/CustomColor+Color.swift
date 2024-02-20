//
//  CustomColor+Color.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

extension CustomColor {

    var asColor: Color {
        return switch self {
        case .black:
            Color.black
        case .dark:
            Color(white: 0.1)
        case .sepia:
            Color.yellow
        case .offWhite:
            Color("cantaloupe")
        case .white:
            Color.white
        }
    }

}
