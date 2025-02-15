//
//  CustomizerView.swift
//  iits
//
//  Created by Guillaume Coquard on 19/02/24.
//
import SwiftUI
import SwiftData

struct CustomizerView: View {

    @Environment(\.scenePhase)
    private var scenePhase

    @Query
    private var sessions: [ReadSession]

    private var timer = Timer.publish(every: 0.1, on: .main, in: .default).autoconnect()

    @State
    private var timeSpent: TimeInterval?

    @State
    private var customizer: RCustomizerModel = .shared

    @State
    private var selectedId: UUID?

    @State
    private var styles: [RCPreset] = RCPreset.defaults

    func getAttributedString(from style: RCPreset) -> AttributedString {
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
        VStack(alignment: .leading) {
            Text("Choose Your Style")
                .font(.headline)
                .padding(.bottom, 16)
                .padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(styles) { style in
                        VStack {
                            Text(getAttributedString(from: style))
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                        .padding()
                        .frame(width: 160, height: 120)
                        .background(Color(style.backgroundColor))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(
                                    style.id == selectedId ? Color.blue : Color.gray.opacity(0.5),
                                    lineWidth: 2
                                )
                        )
                        .onTapGesture {
                            selectedId = style.id
                            customizer.style = style
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .shadow(radius: 10)
        .onAppear {
            self.selectedId = customizer.style.id
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    CustomizerView()
}
