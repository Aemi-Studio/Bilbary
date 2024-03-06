//
//  UIContentSizeCategory.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import Foundation
import UIKit
import SwiftUI

extension UIContentSizeCategory {

    var asDynamic: DynamicTypeSize? {
        DynamicTypeSize(self)
    }

}
