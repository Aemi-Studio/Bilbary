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

    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    //                    Spacer()
                    EPUBView()


                    //                    Spacer()
                }

                .onTapGesture {
                    coordinator.tabBarShown.toggle()
                }
            }
            CustomSheetView()
                .environment(coordinator)
        }.ignoresSafeArea(edges: [.bottom, .horizontal])
    }
}

#Preview {
    BilbaryView()
}
