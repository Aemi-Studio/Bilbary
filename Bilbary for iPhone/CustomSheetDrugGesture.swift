//
//  CustomSheetDrugGesture.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 13/07/24.
//

import SwiftUI

extension View {
    func dragSheetGesture(observer: SheetCoordinator) -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                let delta = gesture.translation.height - observer.previuosOffset
                observer.dragOffset = delta

                let newOffset = (observer.offset + observer.dragOffset)
                    .clamped(to: observer.minHeight...observer.maxHeight)

                observer.self.previuosOffset = gesture.translation.height

                withAnimation(.easeInOut(duration: 0.2)) {
                    observer.offset = newOffset
                }
            }
            .onEnded { _ in
                var endOffset: CGFloat = observer.offset
                if observer.dragOffset < -20 ||
                    observer.offset < observer.screenHeight * 0.37 {
                    endOffset = observer.screenHeight * (observer.heightFactor / 10)
                } else if observer.dragOffset >= 20 ||
                            (observer.offset < observer.screenHeight && observer.offset > observer.screenHeight * 0.65) {
                    endOffset =  observer.maxHeight
                } else if (observer.dragOffset <= 10 && observer.dragOffset >= -20) ||
                            (observer.offset <= observer.screenHeight * 0.65 && observer.offset >= observer.screenHeight * 0.37) {
                    endOffset = observer.screenHeight * observer.heightFactor / 1.9
                }

                withAnimation(.interpolatingSpring( stiffness: 300, damping: 30)) {
                    observer.offset = endOffset
                    observer.dragOffset = 0
                    observer.previuosOffset = 0
                }

            }
    }
}
