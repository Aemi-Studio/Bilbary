//
//  ResizableView.swift
//  Read for iPhone
//
//  Created by Guillaume Coquard on 21/02/24.
//

import SwiftUI

struct ResizableView: View {

    let minHeight: CGFloat = 100

    @State
    var height: CGFloat = 100

    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            RedRectangle(height: $height)
            Spacer()
        }
        .onAppear {
            height = minHeight
        }
    }
}

struct RedRectangle: View {
    @Binding
    var height: CGFloat

    let minHeight: CGFloat = 100

    var body: some View {
        ZStack {
            Color.red
            Resizer()
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            height = max(
                                minHeight,
                                height + value.translation.height
                            )
                        }
                )

        }
            .frame(width: 100, height: minHeight)
            .onAppear {
                height = minHeight
            }
    }
}

struct Resizer: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(width: 75, height: 8)
            .cornerRadius(10)
    }
}

#Preview {
    ResizableView()
}
