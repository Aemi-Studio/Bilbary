//
//  BilbaryTime.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation

enum ReadTime: Int, Identifiable, CaseIterable {

    case aMin = 1
    case fiveMin = 5
    case tenMin = 10
    case thirtyMin = 30
    case anHour = 60

    init?(from id: Int) {
        guard let time: Self = Self.from(id) else {
            return nil
        }
        self = time
    }
}
