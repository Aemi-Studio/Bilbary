//
//  Book+Static.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 29/02/24.
//

import Foundation
import OSLog
import EPUBKit

// MARK: Formatter
extension Book {

    static private var timeIntervalFomatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }

    static private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.preferredLanguages[0])
        formatter.dateStyle = .short
        return formatter
    }

    static func format(_ component: Any) -> String {
        return switch component.self {
        case is TimeInterval:
            Self.timeIntervalFomatter.string(for: component) ?? ""
        case is Date:
            Self.dateFormatter.string(from: component as! Date)
        default:
            String(describing: component)
        }
    }
}
