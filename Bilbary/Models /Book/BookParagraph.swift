//
//  Book+BookParagraph.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 06/03/24.
//

import Foundation

struct BookParagraph: Identifiable, Hashable, Equatable {
    static private let averageWordCountPerMinute: Int = 180
    static private func getWords(_ text: String) -> Int {
        text
            .split(separator: " ")
            .map { $0.trimmingCharacters(in: .punctuationCharacters) }
            .filter({ !$0.isEmpty })
            .count
    }
    static private func littlePieces(_ text: String) -> [String] {
        // Regular expression to match sentence endings along with the sentence
        let pattern = #"(.*?[.!?])\s?"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: text.utf16.count)

        var sentences = [String]()
        regex.enumerateMatches(in: text, options: [], range: range) { (match, _, _) in
            if let matchRange = match?.range(at: 1), let swiftRange = Range(matchRange, in: text) {
                let sentence = String(text[swiftRange])
                sentences.append(sentence)
            }
        }

        var chunks: [String] = []
        var currentChunk: [String] = []
        var currentWordCount = 0

        for sentence in sentences {
            let words = sentence.split(separator: " ")
            let sentenceWordCount = words.count

            // If adding the current sentence would exceed the limit, add the current chunk to chunks and start a new one
            if currentWordCount + sentenceWordCount > Self.averageWordCountPerMinute {
                chunks.append(currentChunk.joined(separator: " "))
                currentChunk = []
                currentWordCount = 0
            }

            // Add the sentence to the current chunk and update the word count
            currentChunk.append(sentence)
            currentWordCount += sentenceWordCount
        }

        // Don't forget to add the last chunk if it's not empty
        if !currentChunk.isEmpty {
            chunks.append(currentChunk.joined(separator: " "))
        }

        return chunks
    }
    private let wrappedValue: String
    public let id: UUID = UUID()
    public let index: Int
    public let wordCount: Int
    public let approximatedTime: TimeInterval
    public var content: String {
        self.wrappedValue
    }
    init(_ text: String, index: Int) {
        self.index = index
        self.wrappedValue = text
            .trimmingCharacters(in: .whitespacesAndNewlines)
        self.wordCount = self.wrappedValue
            .split(separator: " ")
            .map { $0.trimmingCharacters(in: .punctuationCharacters) }
            .filter({ !$0.isEmpty })
            .count
        self.approximatedTime = (Double(self.wordCount) * 60.0) / Double(Self.averageWordCountPerMinute)
    }
    static func from(_ stringLiterals: String...) -> [Self] {
        self.from( stringLiterals )
    }
    static func from(_ strings: [String]) -> [Self] {
        var paragraphs: [Self] = []
        let elements = strings
            .map { literal in
                literal
                    .split(separator: "\n")
                    .flatMap { part in
                        Self.littlePieces(String(part))
                    }
            }
            .flatMap { $0 }
        for (index, element) in elements.enumerated() {
            paragraphs.append(.init(element, index: index))
        }
        return paragraphs
    }
}
