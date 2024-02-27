//
//  BottomSheet.swift
//  Bilbary for iPhone
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

struct BottomSheet<Content: View>: View {

    @Binding
    var isOpen: Bool

    let maxHeight: CGFloat
    let minHeight: CGFloat
    let content: Content

    @GestureState
    private var translation: CGFloat = 0

    init(
        isOpen: Binding<Bool>,
        maxHeight: CGFloat,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
        self.content = content()
        self._isOpen = isOpen
    }

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var indicator: some View {
        Color.clear
            .foregroundStyle(.clear)
            .background(.foreground.opacity(0.25))
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 32))

            .frame(
                width: Constants.indicatorWidth,
                height: Constants.indicatorHeight
            )
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {

                self.indicator
                    .padding(.vertical, 6)

                self.content

            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(.secondarySystemBackground))
            .clipShape(
                UnevenRoundedRectangle(
                    cornerRadii: RectangleCornerRadii(
                        topLeading: Constants.radius,
                        topTrailing: Constants.radius
                    )
                )
            )
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: self.offset)
            .animation(.easeInOut(duration: 0.175), value: isOpen)
            .animation(.easeInOut(duration: 0.175), value: translation)
            .gesture(
                DragGesture()
                    .updating(self.$translation) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded { value in
                        let snapDistance = self.maxHeight * Constants.snapRatio
                        guard abs(value.translation.height) > snapDistance else {
                            return
                        }
                        self.isOpen = value.translation.height < 0
                    }
            )
        }
    }
}
