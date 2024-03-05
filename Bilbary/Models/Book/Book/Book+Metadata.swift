//
//  Book+Metadata.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 05/03/24.
//

import Foundation
import EPUBKit

// MARK: Metadata
extension Book {
    public var metadata: EPUBMetadata? {
        self.document?.metadata
    }

    public var title: String {
        Util.unknownMetadata(self.metadata?.title)
    }

    public var author: String {
        Util.unknownMetadata(self.metadata?.creator?.name)
    }

    public var publisher: String {
        Util.unknownMetadata(self.metadata?.publisher)
    }

    public var description: String {
        Util.unknownMetadata(self.metadata?.description)
    }
}
