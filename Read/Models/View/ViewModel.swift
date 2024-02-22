//
//  ViewModel.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI
import OSLog

@Observable
final class ViewModel {

    static let shared: ViewModel = .init()

    private let logger: Logger = .init()

    public var screenWidth: CGFloat = 0

    public var libraryPath: NavigationPath = .init()
    public var contentPath: NavigationPath = .init()

    public var interfaceVisibility: Bool = false
    public var libraryVisibility: NavigationSplitViewVisibility = .detailOnly {
        didSet {
            if self.libraryVisibility != .detailOnly {
                self.setPopover(to: .library)
            } else if self.activePopover == .library {
                self.setPopover(to: .none)
            }
        }
    }

    public private(set) var activePopover: PopoverType = .none {
        didSet {
            withAnimation {
                if activePopover != .library {
                    libraryVisibility = .detailOnly
                }
            }
        }
    }
    public var isAnyPopoverDisplayed: Bool {
        self.activePopover != .none
    }

    private init() {}

    public func isTogglable(_ type: PopoverType) -> Int {
        if libraryVisibility == .doubleColumn {
            return -1
        }
        return switch self.activePopover {
        case .none:
            0
        case type:
            1
        default:
            -1
        }
    }

    public func activePopover(is type: PopoverType) -> Bool {
        type != .none && self.activePopover == type
    }

    public func setPopover(to type: PopoverType) {
        withAnimation {
            self.activePopover = type
        }
    }

}
