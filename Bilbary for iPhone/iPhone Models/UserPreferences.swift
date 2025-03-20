//
//  UserPreferences.swift
//  Bilbary for iPhone
//
//  Created by Shohjakhon Mamadaliev on 20/03/25.
//

import Foundation
import SwiftData

@Model
class UserPreferences {
    var selectedGoal: ReadGoal

    init(selectedGoal: ReadGoal = .twoHours) {
        self.selectedGoal = selectedGoal
    }
}
