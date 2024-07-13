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

    @Environment(Coordinator.self)
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

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    @State
    private var offset: Double = UIScreen.main.bounds.height * 0.85

    @State
    private var previuosOffset: CGFloat = 0

    @State
    private var dragOffset: CGFloat = 0

    private let minHeight: CGFloat = UIScreen.main.bounds.height * 0.03
    private let maxHeight: CGFloat = UIScreen.main.bounds.height * 0.85
    private let heightFactor: Double = 0.8

    let columns: [GridItem] = [
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center),
        .init(.flexible(minimum: 0, maximum: .infinity), alignment: .center)
    ]

    var body: some View {
        ZStack {
            Rectangle().fill((.black.opacity(0.5)))

            VStack {
                LazyVGrid(columns: columns) {
                    TabButtonItem(
                        title: "Book",
                        systemImage: "book"
                    )
                    TabButtonItem(
                        title: "Reading Time",
                        systemImage: "hourglass"
                    )
                    TabButtonItem(
                        title: "Like",
                        systemImage: "heart"
                    )
                    TabButtonItem(
                        title: "Streak Goal",
                        systemImage: "circlebadge.2"
                    )
                    TabButtonItem(
                        title: "Book",
                        systemImage: "textformat.size"
                    )

                }
                .padding()

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
        .offset(y: offset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    let delta = gesture.translation.height - previuosOffset
                    dragOffset = delta

                    let newOffset = (offset + dragOffset)
                        .clamped(to: minHeight...maxHeight)

                    self.previuosOffset = gesture.translation.height

                    withAnimation(.easeInOut(duration: 0.2)) {
                        offset = newOffset
                    }
                }
                .onEnded { _ in
                    var endOffset: CGFloat = offset
                    if dragOffset < -20 ||
                        offset < screenHeight * 0.37 {
                        endOffset = screenHeight * (heightFactor / 10)
                    } else if dragOffset >= 20 ||
                                (offset < screenHeight && offset > screenHeight * 0.65) {
                        endOffset =  maxHeight
                    } else if (dragOffset <= 10 && dragOffset >= -20) ||
                                (offset <= screenHeight * 0.65 && offset >= screenHeight * 0.37) {
                        endOffset = screenHeight * heightFactor / 1.9
                    }

                    withAnimation(.interpolatingSpring( stiffness: 300, damping: 30)) {
                        offset = endOffset
                        dragOffset = 0
                        previuosOffset = 0
                    }

                }
        )

    }
}
