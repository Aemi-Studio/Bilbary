//
//  MainView.swift
//  iits
//
//  Created by Guillaume Coquard on 21/02/24.
//

import SwiftUI
import EPUBKit
import OSLog

struct EpubView: View {

    private let logger: Logger = .init()

    @State
    private var isImporting: Bool = false

    @State
    private var document: EPUBDocument?

    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 16) {
                VStack {
                    Button("Import ePub File", systemImage: "square.and.arrow.down") {
                        isImporting.toggle()
                    }
                }
                .frame(minHeight: 200)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(spacing: 24) {
                    Text(document?.author?.xmlEscaped ?? "")
                        .fontDesign(.serif)
                    Text(document?.tableOfContents.label ?? "")
                        .fontDesign(.serif)
                }
                .frame(minHeight: 200)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .fileImporter(
            isPresented: $isImporting,
            allowedContentTypes: [.epub],
            allowsMultipleSelection: false
        ) { result in
            do {
                logger.debug("\(String(describing: result))")
                if let selectedFile: URL = try result.get().first {
                    if selectedFile.startAccessingSecurityScopedResource() {
                        document = EPUBDocument(url: selectedFile)
                    }
                    selectedFile.stopAccessingSecurityScopedResource()
                }
            } catch {
                logger.error("\(String(describing: error))")
            }
        }
    }
}

#Preview {
    EpubView()
}
