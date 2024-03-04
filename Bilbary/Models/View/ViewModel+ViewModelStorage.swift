//
//  ViewModelStorage.swift
//  Bilbary for iPad & macOS
//
//  Created by Guillaume Coquard on 26/02/24.
//

import SwiftUI

extension RViewModel {
    internal struct RVMStorage {

        @AppStorage("displayOnboarding")
        var displayOnboarding: Bool = true

    }
}
