//
//  EPUBDocument+Compression.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 29/02/24.
//

import Foundation
import EPUBKit
import OSLog

extension EPUBDocument {
    private static func compress(data: Data) -> Data? {
        do {
            return Data(referencing: try NSData(data: data).compressed(using: .lzfse))
        } catch {
            Logger.epub.error("Data could not be compressed.")
        }
        return nil
    }
    private static func decompress(data: Data) -> Data? {
        do {
            return Data(referencing: try NSData(data: data).decompressed(using: .lzfse))
        } catch {
            Logger.epub.error("Data could not be compressed.")
        }
        return nil
    }
    public static func decompressedContent(from data: Data) -> any Sequence<String> {
        guard let decompressedData = Self.decompress(data: data) else {
            Logger.epub.error("was not able to decompress")
            return []
        }
        guard let decompressedContent = String(
            data: decompressedData,
            encoding: .utf8
        ) else {
            Logger.epub.error("was not able to decompress")
            return []
        }
        do {
            return decompressedContent.split(
                separator: try Regex("\("\u{E000}")")
            ).map(String.init)
        } catch {
            Logger.epub.error("Not able to split the content.")
            return []
        }
    }
    public var compressedContent: Data? {
        let content: [String] = self.content
        let delimiter: String = "\u{E000}"
        let joinedContent: String = content.joined(separator: delimiter)
        guard let dataContent = joinedContent.data(using: .utf8) else {
            Logger.epub.error("Not able to convert string to data.")
            return nil
        }
        return Self.compress(data: dataContent)
    }
}
