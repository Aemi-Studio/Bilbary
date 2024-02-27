//
//  EpubHelper.swift
//  iits
//
//  Created by Guillaume Coquard on 21/02/24.
//

import SwiftUI
import EPUBKit

@Observable
final class EpubHelper {

    static let shared: EpubHelper = .init()

    private let parser: EPUBParser = .init()

    var book: EPUBDocument?

    private init() {}

    func load(from url: URL?) -> EPUBDocument? {
        if let url = url {
            book = .init(url: url)
            return book
        }
        return nil
    }

}
