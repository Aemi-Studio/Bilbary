//
//  Bilbary.swift
//  iits
//
//  Created by Guillaume Coquard on 13/02/24.
//

import SwiftUI
import SwiftData
import OSLog

@main
struct Bilbary: App {

    @State
    private var dataModel: DataModel = .shared

    init() {
        do {
            dataModel.container = try ModelContainer(for: Book.self, BookSession.self)
        } catch {
            fatalError(
                "Something happened when creating the model container."
            )
        }
    }

    var body: some Scene {
        WindowGroup {
            BilbaryView()
                .connectSwiftData()
        }
        .modelContainer(dataModel.container!)
    }
}
