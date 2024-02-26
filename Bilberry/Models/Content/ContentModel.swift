//
//  ContentModel.swift
//  Bilberry
//
//  Created by Guillaume Coquard on 23/02/24.
//

import SwiftUI

@Observable
final class ContentModel {

    static let shared: ContentModel = .init()

    public var contentLength: ReadTime = .aMin

    private init() {}

}
