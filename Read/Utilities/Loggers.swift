//
//  Loggers.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import Foundation
import OSLog

extension Logger {

    static let goals = Logger(subsystem: "GoalModel", category: "goal")
    static let notifications = Logger(subsystem: "UserNotifications", category: "notification")
    static let views = Logger(subsystem: "Views", category: "view")

}
