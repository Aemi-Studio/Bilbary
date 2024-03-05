//
//  BViewModel.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI
import OSLog

@Observable
final class BViewModel {

    static let shared: BViewModel = .init()

    private let storage: RVMStorage = .init()

    public var displayOnboarding: Bool {
        didSet {
            self.storage.displayOnboarding = self.displayOnboarding
        }
    }

    private let logger: Logger = .init()

    public var screenWidth: CGFloat = UIWindow.width
    public var screenHeight: CGFloat = UIWindow.height

    public var libraryPath: NavigationPath = .init()
    public var contentPath: NavigationPath = .init()

    public var libraryWidth: CGFloat = 0

    public var isInterfaceVisible: Bool = false

    public internal(set) var isLibraryOpen: Bool = false
    public internal(set) var activePopover: PopoverType = .none

    private init() {
        self.displayOnboarding = self.storage.displayOnboarding
    }

    public var isAnyPopoverDisplayed: Bool {
        self.activePopover != .none
    }

}
