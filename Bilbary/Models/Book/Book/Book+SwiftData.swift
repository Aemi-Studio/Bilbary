//
//  Book+SwiftData.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import SwiftUI
import SwiftData
import OSLog

// MARK: SwiftData
extension Book {
    @discardableResult
    func save(into context: ModelContext) -> Bool {
        context.insert(self)
        do {
            try context.save()
        } catch {
            Logger.data.error(
                "Saving the model didn't work."
            )
            return false
        }
        return true
    }
}
