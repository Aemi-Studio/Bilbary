//
//  MainView.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//
import SwiftUI

struct BilbaryView: View {
    @State private var showSheet: Bool = false

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
                .presentationDetents([.height(60), .height(300), .large])
                .presentationCornerRadius(20)
                .presentationBackground(Material.ultraThin)
                .presentationContentInteraction(.scrolls)
                .presentationDragIndicator(.hidden)
            //                .interactiveDismissDisabled()
        }

    }

}

// struct BilbaryView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        let appUsageTracker = AppUsageTracker()
//        BilbaryView()
//            .environment(appUsageTracker)
//    }
// }
