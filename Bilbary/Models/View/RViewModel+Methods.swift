//
//  RViewModel+Functions.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import SwiftUI
import OSLog

extension RViewModel {

    public func isTogglable(_ type: PopoverType) -> Int {
        if self.isLibraryOpen {
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

    public func updatePopover(to type: PopoverType) {
        DispatchQueue.main.async {
            withAnimation {
                self.activePopover = type
            }
        }
    }

    internal func updateLibraryWidth(basedOn state: Bool) {
        if state {
            DispatchQueue.main.async {
                withAnimation {
                    self.libraryWidth = min(
                        BConstants.libraryOpenWidth,
                        BConstants.libraryMaximumWidthRatio * self.screenWidth
                    )
                }
            }
        } else {
            DispatchQueue.main.async {
                withAnimation {
                    self.libraryWidth = BConstants.libraryClosedWidth
                }
            }
        }
    }

    public func openLibrary() {
        self.updatePopover(to: .library)
        self.updateLibraryWidth(basedOn: true)
    }

    public func closeLibrary() {
        self.updatePopover(to: .none)
        self.updateLibraryWidth(basedOn: false)
    }

    public func toggleLibrary() {
        self.isLibraryOpen.toggle()
        if self.isLibraryOpen {
            self.openLibrary()
        } else {
            self.closeLibrary()
        }
    }

    public func shiftBook() {
        var books = self.selectedBooks.dropFirst(1)
        books.append(RViewModel.cachedBooks.randomElement()!)
        self.selectedBooks = .init(books)
    }

    public func addBook(drop: Bool = false) {
        var books = self.selectedBooks
        books.append(RViewModel.cachedBooks.randomElement()!)
        self.selectedBooks = .init(books)
    }

}
