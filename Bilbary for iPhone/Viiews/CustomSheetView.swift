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

    @Environment(AppUsageTracker.self)
    private var appUsageTracker

    @Environment(\.scenePhase)
    private var scenePhase

    @Query
    private var sessions: [ReadSession]

    private var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()

    @State
    private var timeSpent: TimeInterval?

    @State
    private var tabs: [TabModel] = [
        .init(id: TabModel.Tab.book),
        .init(id: TabModel.Tab.readingTime),
        .init(id: TabModel.Tab.like),
        .init(id: TabModel.Tab.streakGoal),
        .init(id: TabModel.Tab.customization)
    ]

    @State
    private var activeTab: TabModel.Tab = .book
    @State private var mainViewScrollState: TabModel.Tab?
    @State private var tabBarScrollState: TabModel.Tab?
    @State private var screenHeight = UIScreen.main.bounds.height
    @State private var heightSpacing: CGFloat  = 30

    var body: some View {

        VStack {
            Spacer().frame(height: heightSpacing)
            CustomTabBar()
                .padding()

            ViewScroller()

            Spacer()
        }
        .viewPosition { value in
            let minValue = screenHeight * 0.84
            let clampedValue = value.clamped(to: minValue...minValue + 30)
            let height = clampedValue - minValue
            if height.truncatingRemainder(dividingBy: 3) == 0 {
                withAnimation {
                    heightSpacing = height
                }
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

    }

}

// MARK: - ViewBuilders

extension CustomSheetView {
    @ViewBuilder
    func CustomTabBar () -> some View {

        HStack(spacing: 20) {
            ForEach(tabs) { tab in
                Button(action: {
                    withAnimation(.snappy) {
                        activeTab = tab.id
                        mainViewScrollState = tab.id
                    }

                }) {
                    Spacer()
                    Image(systemName: tab.id.rawValue)
                        .padding(.vertical, 12)
                        .foregroundStyle(activeTab == tab.id ? Color.primary: .gray)
                        .contentShape(.rect)

                }
                .buttonStyle(.plain)

            }
            Spacer()
        }
    }

    @ViewBuilder
    func ViewScroller () -> some View {
        GeometryReader {
            let size = $0.size
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(tabs) { _ in
                        Container()
                            .frame(width: size.width, height: size.height)

                    }

                }.scrollTargetLayout()

            }
            .ignoresSafeArea()
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $mainViewScrollState)
            .scrollIndicators(.hidden)
            .onChange(of: mainViewScrollState) { _, newValue in
                if let newValue {
                    withAnimation(.snappy) {
                        tabBarScrollState = newValue
                        activeTab = newValue
                    }
                }
            }

        }
    }

    @ViewBuilder
    func Container() -> some View {
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
    }
}
