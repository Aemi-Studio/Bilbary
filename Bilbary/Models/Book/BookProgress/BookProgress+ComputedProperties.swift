//
//  BookProgress+ComputedProperties.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import Foundation

extension BookProgress {
    var progress: CGFloat {
        self.endProgress - self.startProgress
    }
}
