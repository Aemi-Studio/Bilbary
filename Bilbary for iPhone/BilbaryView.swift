//
//  MainView.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI
import SwiftData

struct BilbaryView: View {

    @Environment(\.modelContext)
    private var context

    @Environment(AppUsageTracker.self)
    private var appUsageTracker

    @State
    private var coordinator = Coordinator()

    @State
    private var detent: PresentationDetent = .height(64)

    @State
    private var tabBarShown: Bool = false

    @Environment(\.scenePhase)
    private var scenePhase

    @Query
    private var sessions: [ReadSession]

    private var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()

    @State
    private var timeSpent: TimeInterval?

    let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center)
    ]

    @State
    private var sheetOffset: Double = 100
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    Spacer()
                    EPUBView()
                    Spacer()
                }.padding()
                .onTapGesture {
                    tabBarShown.toggle()
                    if tabBarShown {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            sheetOffset = 0
                        }
                    } else {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            sheetOffset = 100
                        }
                    }
                }
            }
            CustomSheetView()
                .offset(y: sheetOffset)
                .environment(coordinator)
        }

        //            .scrollDisabled(true)
        //            .background(.black.opacity(0.5))
        //            .background(.ultraThinMaterial)
        //            .presentationDetents(
        //                [.height(64), .large],
        //                selection: $detent
        //            )
        //            .presentationBackgroundInteraction(
        //                .enabled(upThrough: .height(64))
        //            )
        //            .presentationDragIndicator(.hidden)
        //            .presentationCompactAdaptation(.automatic)
        //            .interactiveDismissDisabled()
        //        }

    }
}

#Preview {
    BilbaryView()
}
