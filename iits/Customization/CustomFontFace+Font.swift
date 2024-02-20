//
//  CustomFontFace+Font.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

extension CustomFontFace {
    
    var asFont: Font {
        return switch self {
            case .newYork:
                Font.custom("New York", size: 1.0, relativeTo: .body)
            case .georgia:
                Font.custom("Georgia", size: 1.0, relativeTo: .body)
            case .timesNewRoman:
                Font.custom("Times New Roman", size: 1.0, relativeTo: .body)
            case .canela:
                Font.custom("Canela", size: 1.0, relativeTo: .body)
        }
    }

}
