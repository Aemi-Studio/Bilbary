//
//  RViewModel.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI
import OSLog

@Observable
final class RViewModel {

    static let shared: RViewModel = .init()

    private let storage: RVMStorage = .init()
    public var displayOnboarding: Bool {
        didSet {
            self.storage.displayOnboarding = self.displayOnboarding
        }
    }

    public var proxy: GeometryProxy?

    private let logger: Logger = .init()

    public var screenWidth: CGFloat = 0

    public var libraryPath: NavigationPath = .init()
    public var contentPath: NavigationPath = .init()

    public var libraryWidth: CGFloat = 0

    public var interfaceVisibility: Bool = false
    public var libraryVisibility: Bool = false {
        didSet {
            if libraryVisibility {
                withAnimation {
                    self.libraryWidth = BConstants.libraryClosedWidth
                }
                self.setPopover(to: .none)
            }else{
                withAnimation {
                    self.libraryWidth = BConstants.libraryOpenWidth
                }
                self.setPopover(to: .library)
            }
        }
    }

    public private(set) var activePopover: PopoverType = .none {
        didSet {
            logger.info("\(String(describing: self.activePopover))")
        }
    }

    public var isAnyPopoverDisplayed: Bool {
        self.activePopover != .none
    }

    private init() {
        self.displayOnboarding = self.storage.displayOnboarding
    }

    public func isTogglable(_ type: PopoverType) -> Int {
        if libraryVisibility {
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
