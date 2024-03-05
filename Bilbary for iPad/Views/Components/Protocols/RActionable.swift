//
//  RInterfaceActionable.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

protocol RActionable {
    var type: BViewModel.PopoverType { get }
    var isUIActive: Bool { get }
}
