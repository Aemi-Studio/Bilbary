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

    private var columns: [GridItem] = .init(
        repeating: .init(.flexible(minimum: 48, maximum: .infinity), spacing: 4, alignment: .center ),
        count: 6
    )

    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(styles) { style in
                    Button {
                        withAnimation {
                            customizer.style = style
                        }
                    } label: {
                        VStack {
                            Text(
                                style.present("Aa")
                            )
                            .font(.title)
                        }
                        .padding()
                        .aspectRatio(1.0, contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 96)
                        .foregroundStyle(style.foregroundColor(customizer.colorScheme))
                        .background(style.backgroundColor(customizer.colorScheme))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(white: 0, opacity: 0.5), lineWidth: 0.2)
                                .foregroundStyle(.clear)
                        }
                        .tag(style.id)
                    }
                    .buttonStyle(.plain)
                }
            }
            Divider()
                .padding(.vertical)
            VStack(spacing: 16) {
                Group {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Font Size")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .textCase(.uppercase)
                            .kerning(0.2)
                            .foregroundStyle(Color.userDefinedForeground.secondary)
                        Slider(value: $customizer.fontSize, in: 16.0...64.0) {
                            Label("Font Size", systemImage: "textformat.size")
                        } minimumValueLabel: {
                            Label("Smaller Font Size", systemImage: "textformat.size.smaller")
                                .labelStyle(.iconOnly)
                        } maximumValueLabel: {
                            Label("Larger Font Size", systemImage: "textformat.size.larger")
                                .labelStyle(.iconOnly)
                        }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Kerning")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .textCase(.uppercase)
                            .kerning(0.2)
                            .foregroundStyle(Color.userDefinedForeground.secondary)
                        Slider(value: $customizer.kerning, in: -1.0...3.0, step: 0.2) {
                            Label("Kerning", systemImage: "character")
                        } minimumValueLabel: {
                            Label("Tighter Kerning", systemImage: "minus")
                                .labelStyle(.iconOnly)
                        } maximumValueLabel: {
                            Label("Looser Kerning", systemImage: "plus")
                                .labelStyle(.iconOnly)
                        }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Line Height")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .textCase(.uppercase)
                            .kerning(0.2)
                            .foregroundStyle(Color.userDefinedForeground.secondary)
                        Slider(value: $customizer.lineHeight, in: 0...100.0, step: 0.1) {
                            Label("Line Height", systemImage: "arrow.up.and.down.text.horizontal")
                        } minimumValueLabel: {
                            Label("Smaller", systemImage: "minus")
                                .labelStyle(.iconOnly)
                        } maximumValueLabel: {
                            Label("Taller", systemImage: "plus")
                                .labelStyle(.iconOnly)
                        }
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Paragraph Spacing")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .textCase(.uppercase)
                            .kerning(0.2)
                            .foregroundStyle(Color.userDefinedForeground.secondary)
                        Slider(value: $customizer.paragraphSpacing, in: 0...100.0, step: 0.1) {
                            Label("Paragraph Spacing", systemImage: "arrow.up.and.down.text.horizontal")
                        } minimumValueLabel: {
                            Label("Smaller", systemImage: "minus")
                                .labelStyle(.iconOnly)
                        } maximumValueLabel: {
                            Label("Taller", systemImage: "plus")
                                .labelStyle(.iconOnly)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
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
