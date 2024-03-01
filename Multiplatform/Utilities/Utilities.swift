//
//  Utilities.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import Foundation
import UIKit
import OSLog
import SwiftUI

final class Util {
    static func getImageData(from url: URL?) async -> Data? {
        if let url = url {
            do {
                return try await withCheckedThrowingContinuation { continuation in
                    let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else if let data = data {
                            continuation.resume(returning: data)
                        } else {
                            continuation.resume(returning: nil)
                        }
                    }
                    task.resume()
                }
            } catch {
                Logger.util.error("Something went wrong when loading the image from <\(url)>")
            }
        }
        return nil
    }

    static func getUIImage(from url: URL?) async -> UIImage? {
        guard let url = url else {
            Logger.util.error("URL is nil <\(String(describing: url))>")
            return nil
        }

        guard let imageData = await Self.getImageData(from: url) else {
            Logger.util.error("Something went wrong when loading the image from <\(url)>")
            return nil
        }

        return UIImage(data: imageData)
    }

    static func getImage(from url: URL?) async -> Image? {

        guard let url = url else {
            Logger.util.error("URL is nil <\(String(describing: url))>")
            return nil
        }

        guard let uiImage: UIImage = await Self.getUIImage(from: url) else {
            Logger.util.error("Something went wrong when loading the image from <\(url)>")
            return nil
        }

        return Image(uiImage: uiImage)
    }

    static func getAppName() -> String {

        if let displayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return displayName
        }

        if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }

        return "the App"
    }
}
