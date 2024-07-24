//
//  HomeView.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 24/07/24.
//

import SwiftUI

struct HomeView: View {
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
    var body: some View {
        VStack {
            //            HeaderView()

            CustomTabBar()

            GeometryReader {
                let size = $0.size

                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(tabs) { tab in
                            Image(systemName: tab.id.rawValue)
                                .frame(width: size.width, height: size.height)
                                .contentShape(.rect)

                        }

                    }.scrollTargetLayout()
                }
                .scrollPosition(id: $mainViewScrollState)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
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
    }

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
}

#Preview {
    ContentView()
}
