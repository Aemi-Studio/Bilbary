//
//  Book+BookCover.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation
import OSLog
import UIKit
import SwiftUI

extension Book {

    struct BookCover {

        public let url: URL

        init?(url: URL?) {
            guard let url = url else {
                Logger.book.warning("URL is nil.")
                return nil
            }
            self.url = url
        }

        public func `as`<T>(_ output: T.Type) async -> T? {
            switch output {
            case is Data.Type:
                return await Util.getImageData(from: self.url) as? T
            case is UIImage.Type:
                return await Util.getUIImage(from: self.url) as? T
            case is Image.Type:
                return await Util.getImage(from: self.url) as? T
            default:
                return nil
            }
        }
    }
}
