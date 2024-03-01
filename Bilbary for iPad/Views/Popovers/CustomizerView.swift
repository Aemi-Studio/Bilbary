//
//  CustomizerView.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//

import SwiftUI

struct CustomizerView: View {

    @State
    private var customizer: RCustomizerModel = .shared

    @State
    private var selectedId: UUID?

    @State
    private var styles: [RCPreset] = RCPreset.defaults

    private var columns: [GridItem] = [
        .init(.flexible(minimum: 100, maximum: 200), spacing: 2, alignment: .center),
        .init(.flexible(minimum: 100, maximum: 200), spacing: 2, alignment: .center),
        .init(.flexible(minimum: 100, maximum: 200), spacing: 2, alignment: .center),
        .init(.flexible(minimum: 100, maximum: 200), spacing: 2, alignment: .center)
    ]

    func getAttibutedString(from style: RCPreset) -> AttributedString {
        var attributedString = AttributedString("Aa")
        if style.fontFace == .default {
            attributedString.font = .system(size: 48)
        } else {
            attributedString.font = .custom(style.fontFace.rawValue, size: 48, relativeTo: .body)
        }
        attributedString.kern = 0.1
        return attributedString
    }

    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(styles) { style in
                    VStack {
                        Text(
                            getAttibutedString(from: style)
                        )
                    }
                    .padding()
                    .frame(width: 192, height: 128)
                    .foregroundColor(Color(style.fontColor))
                    .background(style.backgroundColor)
                    .overlay {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(white: 0, opacity: 0.5), lineWidth: 0.2)
                            .foregroundStyle(.clear)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .tag(style.id)
                }
            }
        }
        .frame(minWidth: 200)
        .padding()
        .background(.regularMaterial)
        .onAppear {
            self.selectedId = customizer.style.id
        }
    }
}

#Preview {
    CustomizerView()
}
