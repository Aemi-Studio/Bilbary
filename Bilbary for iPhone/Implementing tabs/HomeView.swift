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
        .init(id: TabModel.Tab.research),
        .init(id: TabModel.Tab.developmnet),
        .init(id: TabModel.Tab.analytics),
        .init(id: TabModel.Tab.audience),
        .init(id: TabModel.Tab.privacy)

    ]
    @State
    private var activeTab: TabModel.Tab = .research
    @State private var mainViewScrollState: TabModel.Tab?
    var body: some View {
        VStack {
            //            HeaderView()
            CustomTabBar()

            GeometryReader {
                let size = $0.size

                ScrollView(.horizontal) {
                    LazyHStack(spacing: 0) {
                        ForEach(tabs) { tab in
                            Text(tab.id.rawValue )
                                .frame(width: size.width, height: size.height)
                                .contentShape(.rect)

                        }

                    }.scrollTargetLayout()
                }
                .scrollPosition(id: $mainViewScrollState)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
            }
        }
    }

    //    @ViewBuilder
    //    func HeaderView() -> some View {
    //        HStack {
    //            Image(.logo)
    //                .resizable()
    //                .aspectRatio(contentMode: .fit)
    //                .frame(width: 100)
    //
    //            Spacer(minLength: 0)
    //        }.padding(15)
    //    }

    @ViewBuilder
    func CustomTabBar () -> some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(tabs) { tab in
                    Button(action: {
                        withAnimation(.snappy) {
                            activeTab = tab.id
                            mainViewScrollState = tab.id
                        }
                    }) {
                        Text(tab.id.rawValue)
                            .padding(.vertical, 12)
                            .foregroundStyle(activeTab == tab.id ? Color.primary: .gray)
                            .contentShape(.rect)
                    }
                    .buttonStyle(.plain)

                }
            }
        }
        .safeAreaPadding(.horizontal, 15)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
