//
//  MainView.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//
import SwiftUI

struct BilbaryView: View {
    @State private var showSheet: Bool = false
    @State private var mask: Bool = false
    let screenHeight = UIScreen.main.bounds.height

    var body: some View {

        ZStack {

            VStack {
                EPUBView()
            }

            VStack {

                Rectangle().fill(Color.black)
                    .frame(height: screenHeight / 3)
                    .visualEffect { content, geoProxy in
                        content
                            .colorEffect(ShaderLibrary.fadeOut(.float(geoProxy.size.height), .float(1.0)))
                    }
                    .allowsHitTesting(false)

                Spacer()

                Rectangle().fill(Color.black)
                    .frame(height: screenHeight / 3)
                    .visualEffect { content, geoProxy in
                        content
                            .colorEffect(ShaderLibrary.fadeOut(.float(geoProxy.size.height), .float(0.0)))
                    }
                    .allowsHitTesting(false)
            }

        }
        .onTapGesture {
            showSheet.toggle()
        }
        .ignoresSafeArea(edges: [ .horizontal, .vertical])
        .sheet(isPresented: $showSheet) {
            CustomSheetView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .presentationDetents([.height(50), .medium, .large])
                .presentationCornerRadius(20)
                .presentationBackground(Material.ultraThin.opacity(0.1))
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
                .presentationContentInteraction(.scrolls)
                .presentationDragIndicator(.hidden)
                .presentationCompactAdaptation(horizontal: .none, vertical: .none)
                .interactiveDismissDisabled()
                .maskForSheet(mask: mask)

        }

    }

}


