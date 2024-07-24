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

                    EPUBView()

                }
                .onTapGesture {
                    coordinator.tabBarShown.toggle()
                }
                VStack {

                    Rectangle().fill(Color.black)
                        .frame(height: coordinator.screenHeight / 3)
                        .visualEffect { content, geoProxy in
                            content
                                .colorEffect(ShaderLibrary.fadeOut(.float(geoProxy.size.height), .float(1.0)))
                        }
                        .allowsHitTesting(false)

                    Spacer()

                    Rectangle().fill(Color.black)
                        .frame(height: coordinator.screenHeight / 3)
                        .visualEffect { content, geoProxy in
                            content
                                .colorEffect(ShaderLibrary.fadeOut(.float(geoProxy.size.height), .float(0.0)))
                        }
                        .allowsHitTesting(false)
                }

            }

            CustomSheetView()
                .environment(coordinator)

        }.ignoresSafeArea(edges: [ .horizontal, .vertical])

    }

}

// #Preview {
//    BilbaryView()
// }
