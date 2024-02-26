//
//  GoalReadTime.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 23/02/24.
//

import Foundation

enum GoalReadTime: Int, CaseIterable {
    typealias RawValue = ReadTime.RawValue
    case none = 0
    case aMin = 1
    case fiveMin = 5
    case tenMin = 10
    case thirtyMin = 30
    case anHour = 60
}
