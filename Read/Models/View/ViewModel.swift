//
//  ViewModel.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

@Observable
final class ViewModel {

    static let shared: ViewModel = .init()

    public var libraryPath: NavigationPath = .init()
    public var contentPath: NavigationPath = .init()

    public var libraryVisibility: NavigationSplitViewVisibility = .detailOnly

    private init() {}

    public func toggleSidebar() {
        self.libraryVisibility = self.libraryVisibility == .detailOnly ? .doubleColumn : .detailOnly
    }

    public func goTo<H: Hashable>(_ value: H, for columnType: ColumnType = .library) {
        switch columnType {
        case .library:
            self.libraryPath.append(value)
        case .content:
            self.contentPath.append(value)
        }
    }

    // swiftlint:disable:next identifier_name
    public func goBack(_ k: Int = 1, for columnType: ColumnType = .library) {
        switch columnType {
        case .library:
            self.libraryPath.removeLast(k)
        case .content:
            self.contentPath.removeLast(k)
        }
    }

    public func replace<H: Hashable>(_ value: H, for columnType: ColumnType = .library) {
        var path: NavigationPath = switch columnType {
        case .library:
            self.libraryPath
        case .content:
            self.contentPath
        }

        path.removeLast()
        path.append(value)

    }

}
