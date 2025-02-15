//
//  AppModel.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 11/07/24.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class ReadSession: Identifiable {
    
    typealias ID = UUID
    
    @Attribute(.unique)
    let id: ID = ID()
    
    let startTime: Date
    private(set) var endTime: Date?
    
    init() {
        self.startTime = .now
    }
    
    func end() -> Self {
        self.endTime = .now
        return self
    }
    
    var duration: TimeInterval {
        let end = endTime ?? .now
        return end.timeIntervalSince(startTime)
    }
    
}







@MainActor
let AppModelContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: ReadSession.self, UserPreferences.self)
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()


