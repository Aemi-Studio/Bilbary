//
//  View.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import SwiftUI
import UIKit

struct NavigationBarTitleColor: ViewModifier {

    init(customizer: RCustomizerModel = .shared) {
        UINavigationBar.appearance().standardAppearance = customizer.navigationAppearance
        UINavigationBar.appearance().compactAppearance = customizer.navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = customizer.navigationAppearance
    }

    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarTitleTextColor() -> some View {
        modifier(NavigationBarTitleColor())
    }
}
