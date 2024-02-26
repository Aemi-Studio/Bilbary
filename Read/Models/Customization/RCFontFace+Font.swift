//
//  RCFontFace+Font.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

extension RCFontFace {

    var asFont: Font {
        return switch self {
        case .newYork:
            Font.custom("New York", size: UIFont.systemFontSize, relativeTo: .body)
        case .georgia:
            Font.custom("Georgia", size: UIFont.systemFontSize, relativeTo: .body)
        case .timesNewRoman:
            Font.custom("Times New Roman", size: UIFont.systemFontSize, relativeTo: .body)
        case .canela:
            Font.custom("Canela", size: UIFont.systemFontSize, relativeTo: .body)
        case .charter:
            Font.custom("Charter", size: UIFont.systemFontSize, relativeTo: .body)
        case .avenir:
            Font.custom("Avenir", size: UIFont.systemFontSize, relativeTo: .body)
        case .palatino:
            Font.custom("Palatino", size: UIFont.systemFontSize, relativeTo: .body)
        default:
            Font.body
        }
    }

}
