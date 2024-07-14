//
//  CustomSheetView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//
import SwiftUI
import SwiftData

struct CustomSheetView: View {

    @Environment(\.modelContext)
    private var context

    @Environment(SheetCoordinator.self)
    private var coordinator

    @Environment(AppUsageTracker.self)
    private var appUsageTracker

    @Environment(\.scenePhase)
    private var scenePhase

    @Query
    private var sessions: [ReadSession]

    private var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()

    @State
    private var timeSpent: TimeInterval?

    var body: some View {
        ZStack {
            Spacer()

            VStack {
                TabGridView()

                VStack(spacing: 16) {

                    VStack {
                        EmptyView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(.bar)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()

                    ScrollView {

                        VStack {
                            if let timeSpent = timeSpent {
                                VStack {
                                    Text(timeSpent, format: .number.rounded(rule: .toNearestOrEven, increment: 1))
                                        .padding()
                                    Text("\(sessions.count) sessions")
                                        .padding()
                                }
                            }
                            HStack {
                                Text("Library")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Spacer()
                            } .padding()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                Spacer()
            }

        }
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
        .onChange(of: coordinator.tabBarShown) {
            if coordinator.tabBarShown {

                withAnimation(.easeInOut(duration: 0.2)) {
                    coordinator.offset = UIScreen.main.bounds.height * 0.85
                }
            } else {

                withAnimation(.easeInOut(duration: 0.2)) {
                    coordinator.offset = UIScreen.main.bounds.height * 1.1

                }
            }
        }
        .background(.ultraThinMaterial)
        .clipShape(
            .rect(
                cornerRadii: .init(topLeading: 16.0, bottomLeading: 0, bottomTrailing: 0, topTrailing: 16.0)
            )
        )
        .offset(y: coordinator.offset)
        .gesture(
            dragSheetGesture(observer: coordinator)
        )

    }
}
