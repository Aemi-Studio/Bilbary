//
//  CustomSheetView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//
import SwiftUI
import SwiftData

struct CustomSheetView: View {
    
    @State private var toggleState: Bool = false
    
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
    func ViewScroller() -> some View {
        GeometryReader {
            let size = $0.size
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(tabs) { tab in
                        if tab.id == .customization {
                            CustomizationView()
                                .frame(width: size.width, height: size.height)
                        } else if tab.id == .book {
                            BooksView()
                                .frame(width: size.width, height: size.height)
                        }
                        else if tab.id == .readingTime {
                            TimerView()  // Show CustomBooksView when active tab is .book
                                .frame(width: size.width, height: size.height)
                        }
                        
                        else if tab.id == .streakGoal {
                            VStack{
                                StreakView()
                            }
                                .frame(width: size.width, height: size.height)
                        }
                        
                        else {
                            Container()
                                .frame(width: size.width, height: size.height)
                        }
                        
                    }
                    
                }
            }
            .scrollTargetLayout()
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
    
    @ViewBuilder
    func CustomizationView() -> some View {
        VStack(spacing: 16) {
            VStack {
                Text("Customization View")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.bar)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding()
            
            ScrollView {
                
            }
        }
    }
    
    @ViewBuilder
    func TimerView() -> some View {
                VStack {
                    if let timeSpent = timeSpent {
                        VStack {
                            Text("This View For Content Lenght")
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    

    @ViewBuilder
    func StreakView() -> some View {
        VStack {
            // Title Section
            HStack {
                Text("3 Streak")
                    .font(.title)
                    .bold()
                Spacer()
            }
            .padding()
            WeekView()
            Spacer()
            
           
            VStack(spacing: 16) {
                HStack {
                    Text("Read for")
                    Spacer()
                    Menu {
                        Button("5 minutes", action: { })
                        Button("10 minutes", action: { })
                        Button("15 minutes", action: { })
                    } label: {
                        Text("5 minutes")
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                HStack {
                    Text("Streak")
                    Spacer()
                    Menu {
                        Button("3 months", action: {  })
                        Button("6 months", action: { })
                        Button("12 months", action: { })
                    } label: {
                        Text("3 months")
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.secondary.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                
                HStack {
                    Text("Streak")
                    Spacer()
                    Toggle("", isOn: $toggleState)
                        .labelsHidden()
                        .tint(Color.gray.opacity(0.6))
                }
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) 
    }
}
