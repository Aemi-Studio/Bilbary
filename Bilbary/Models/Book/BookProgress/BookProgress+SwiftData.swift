//
//  BookProgress+SwiftData.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import Foundation
import SwiftData
import OSLog

extension BookProgress {

    @discardableResult
    public func update(to book: Book) -> Self {
        self.book = book
        return self
    }

    @discardableResult
    public func start(
        at date: Date,
        from startProgress: CGFloat
    ) -> Self {
        self.startDate = date
        self.startProgress = startProgress
        return self
    }

    @discardableResult
    public func update(
        to book: Book,
        at date: Date,
        from startProgress: CGFloat
    ) -> Self {
        self.book = book
        self.startDate = date
        self.startProgress = startProgress
        return self
    }

    @discardableResult
    public func save(
        upTo endProgress: CGFloat,
        into context: ModelContext
    ) -> Bool {
        self.endDate = Date.now
        self.endProgress = endProgress
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
