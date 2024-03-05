//
//  RReadingTimeMenu.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 23/02/24.
//

import SwiftUI
import OSLog

struct RReadingTimeMenu: View {

    @State
    private var readModel: BReadModel = .shared

    @State
    private var viewModel: BViewModel = .shared

    private var logger: Logger = .init()

    var body: some View {
        RButton(
            isShown: $viewModel.isInterfaceVisible,
            linkedTo: .readingTime,
            action: {}
        ) {
            AnyView(
                Menu {
                    Picker(
                        NSLocalizedString(
                            "Select a content length",
                            comment: "Picker string for content length/duration"),
                        selection: $readModel.contentLength
                    ) {
                        ForEach(ReadTime.allCases, id: \.self) { time in
                            Button {
                                readModel.contentLength = time
                            } label: {
                                Text(time.asString)
                            }

                        }
                    }
                }
                label: {
                    HStack(spacing: 0) {
                        Group {
                            Text(readModel.contentLength.asString)
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
