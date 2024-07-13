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

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Book Content")
                Spacer()
            }
            .onTapGesture {
                tabBarShown.toggle()
            }
            CustomSheetView()
        }
        //        .sheet(isPresented: $tabBarShown) {
        //            ScrollView(.vertical) {
        //
        //                LazyVGrid(columns: columns) {
        //                    TabButtonItem(
        //                        title: "Book",
        //                        systemImage: "book"
        //                    )
        //                    TabButtonItem(
        //                        title: "Reading Time",
        //                        systemImage: "hourglass"
        //                    )
        //                    TabButtonItem(
        //                        title: "Like",
        //                        systemImage: "heart"
        //                    )
        //                    TabButtonItem(
        //                        title: "Streak Goal",
        //                        systemImage: "circlebadge.2"
        //                    )
        //                    TabButtonItem(
        //                        title: "Book",
        //                        systemImage: "textformat.size"
        //                    )
        //                }
        //                .padding()
        //
        //                VStack(spacing: 16) {
        //
        //                    VStack {
        //                        EmptyView()
        //                    }
        //                    .frame(maxWidth: .infinity)
        //                    .frame(height: 200)
        //                    .background(.regularMaterial)
        //                    .clipShape(RoundedRectangle(cornerRadius: 8))
        //
        //                    ScrollView {
        //
        //                        VStack {
        //                            if let timeSpent = timeSpent {
        //                                VStack {
        //                                    Text(timeSpent, format: .number.rounded(rule: .toNearestOrEven, increment: 1))
        //                                        .padding()
        //                                    Text("\(sessions.count) sessions")
        //                                        .padding()
        //                                }
        //                            }
        //                            HStack {
        //                                Text("Library")
        //                                    .font(.largeTitle)
        //                                    .fontWeight(.bold)
        //                                Spacer()
        //                            }
        //                            Spacer()
        //                        }
        //                        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //                    }
        //                }
        //                .padding()
        //            }
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
        .onReceive(self.timer) { _ in
            timeSpent = appUsageTracker.computeTimeSpentToday(sessions)
        }
        .onAppear {
            appUsageTracker.startSession(to: context)
        }
        .onDisappear {
            appUsageTracker.endSession(to: context)
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .active:
                appUsageTracker.startSession(to: context)
            default:
                appUsageTracker.endSession(to: context)
            }
        }
    }
}

#Preview {
    BilbaryView()
}
