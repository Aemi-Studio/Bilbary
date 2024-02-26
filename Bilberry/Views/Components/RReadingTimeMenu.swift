//
//  RReadingTimeMenu.swift
//  Bilberry
//
//  Created by Guillaume Coquard on 23/02/24.
//

import SwiftUI
import OSLog

struct RReadingTimeMenu: View {

    @State
    private var contentModel: ContentModel = .shared

    @State
    private var viewModel: RViewModel = .shared

    private var logger: Logger = .init()

    var body: some View {
        RButton(
            isShown: $viewModel.interfaceVisibility,
            linkedTo: .readingTime
        ) {
            logger.log("sds")
        } label: {
            AnyView(
                Menu {
                    Picker(
                        NSLocalizedString(
                            "Select a content length",
                            comment: "Picker string for content length/duration"),
                        selection: $contentModel.contentLength
                    ) {
                        ForEach(ReadTime.allCases, id: \.self) { time in
                            Button {
                                contentModel.contentLength = time
                            } label: {
                                Text(time.asString)
                            }

                        }
                    }
                }
                label: {
                    HStack(spacing: 0) {
                        Group {
                            Text(contentModel.contentLength.asString)
                            Text(" Read")
                                .opacity(0.5)
                                .padding(.leading, 4)
                        }
                        .textCase(.uppercase)
                        .fontWeight(.bold)
                    }
                }
            )
        }
    }
}

#Preview {
    RReadingTimeMenu()
}
