//
//  BVMScreenSizeUpdate.swift
//  Bilbary
//
//  Created by Guillaume Coquard on 01/03/24.
//

import SwiftUI

struct BVMScreenSizeUpdate: ViewModifier {

    @State
    private var view: BViewModel = .shared

    private let orientationChanged = NotificationCenter.default
        .publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()

    func body(content: Content) -> some View {
        content
            .frame(minWidth: view.screenWidth)
            .frame(maxWidth: view.screenWidth)
            .onReceive(orientationChanged) { _ in
                Task { @MainActor in
                    try await Task.sleep(for: .seconds(0.2))
                    withAnimation {
                        view.screenWidth = UIWindow.width
                    }
                }
            }
    }
}

extension View {

    func orientationUpdatesScreen() -> some View {
        modifier(BVMScreenSizeUpdate())
    }

}
