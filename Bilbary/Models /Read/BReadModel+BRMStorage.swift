//
//  BReadModel+BRMStorage.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import SwiftUI

extension BReadModel {
    internal struct BRMStorage {
        @AppStorage("brmContentLength")
        var brmContentLength: Int = 0
    }
}
