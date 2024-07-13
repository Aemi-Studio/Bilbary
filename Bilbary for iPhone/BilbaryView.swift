//
//  MainView.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct BilbaryView: View {

    @State
    private var coordinator = SheetCoordinator()

    @State
    private var tabBarShown: Bool = false

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
    }
}

#Preview {
    BilbaryView()
}
