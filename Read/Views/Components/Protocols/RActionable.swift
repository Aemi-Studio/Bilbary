//
//  RInterfaceActionable.swift
//  Read
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

protocol RActionable {
    var type: ViewModel.PopoverType { get }
    var isUIActive: Bool { get }
}
