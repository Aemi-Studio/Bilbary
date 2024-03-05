//
//  DataModel.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 04/03/24.
//

import SwiftUI
import SwiftData
import OSLog

@Observable
final class DataModel {

    static let shared: DataModel = .init()

    static var container: ModelContainer? {
        get {
            Self.shared.container
        }
    }
    static var context: ModelContext? {
        get {
            Self.shared.context
        }
    }

    private var _container: ModelContainer?
    private var _context: ModelContext?

    public var container: ModelContainer? {
        get {
            self._container
        }
        set {
            if self._container == nil {
                self._container = newValue
            } else {
                Logger.data.error(
                    "Model container can't be set multiple times."
                )
            }
        }
    }
    public var context: ModelContext? {
        get {
            self._context
        }
        set {
            if self._context == nil {
                self._context = newValue
            } else {
                Logger.data.error(
                    "Model context can't be set multiple times."
                )
            }
        }
    }

    private init() {}
}
