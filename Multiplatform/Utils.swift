//
//  Utils.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 28/02/24.
//

import Foundation

func getAppName() -> String {

    if let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
        return displayName
    }

    if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
        return bundleName
    }

    return "the App"
}
