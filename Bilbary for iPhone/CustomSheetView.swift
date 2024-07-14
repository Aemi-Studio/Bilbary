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
            Rectangle().fill((.black.opacity(0.5)))

            VStack {
                TabGridView()

                VStack(spacing: 16) {

                    VStack {
                        EmptyView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 8))

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
                            }
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
        .background(.ultraThinMaterial)
        .cornerRadius(20.0)
        .offset(y: coordinator.offset)
        .gesture(
            dragSheetGesture(observer: coordinator)
        )

    }
}
