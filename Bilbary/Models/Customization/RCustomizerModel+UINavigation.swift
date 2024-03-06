//
//  RCustomizerModel+UINavigation.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import Foundation
import UIKit

extension RCustomizerModel {

    var navigationAppearance: UINavigationBarAppearance {
        let navbarAppearance = UINavigationBarAppearance()
        navbarAppearance.largeTitleTextAttributes = [
            .foregroundColor: self.foregroundColor
        ]
        navbarAppearance.titleTextAttributes = [
            .foregroundColor: self.foregroundColor
        ]
        return navbarAppearance
    }

}
