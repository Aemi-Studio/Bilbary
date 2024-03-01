//
//  Logger.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 29/02/24.
//

import Foundation
import OSLog

extension Logger {

    public static let book: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "book"
    )
    public static let epub: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "epub"
    )
    public static let util: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "util"
    )
    public static let goals: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "goal"
    )
    public static let notifications: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "notification"
    )
    public static let views: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "view"
    )
    public static let filePicker: Self = .init(
        subsystem: Bundle.main.bundleIdentifier ?? "Bilbary",
        category: "picker"
    )

}
