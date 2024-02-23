//
//  PressActions.swift
//  Read
//
//  Created by Guillaume Coquard on 22/02/24.
//

import SwiftUI

struct PressActions: ViewModifier {
    var onPress: (DragGesture.Value) -> Void = { _ in }
    var onRelease: (DragGesture.Value) -> Void = { _ in }
    var onPress_: () -> Void = {}
    var onRelease_: () -> Void = {}
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged {
                        onPress($0)
                        onPress_()
                    }
                    .onEnded {
                        onRelease($0)
                        onRelease_()
                    }
            )
    }
}

extension View {

    func onPress(action: @escaping (DragGesture.Value) -> Void) -> some View {
        modifier(PressActions(onPress: action))
    }

    func onRelease(action: @escaping (DragGesture.Value) -> Void) -> some View {
        modifier(PressActions(onRelease: action))
    }

    func onPress(action: @escaping () -> Void) -> some View {
        modifier(PressActions(onPress_: action))
    }

    func onRelease(action: @escaping () -> Void) -> some View {
        modifier(PressActions(onRelease_: action))
    }

}
