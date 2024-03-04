//
//  GeneralLibraryStructs.swift
//  Bilbary for iPad & macOS
//
//  Created by Luca Gargiulo on 26/02/24.
//

import Foundation
import SwiftUI

struct CustomButton: View {
    var action: () -> Void

    var nameImage: String
    var text: String

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: action) {
            HStack {
                if nameImage != "" {
                    Image(systemName: nameImage)
                        .foregroundColor(colorScheme == .dark ? .white : .black) // Image color
                }

                if text != "" {
                    Text(text)
                        .foregroundColor(colorScheme == .dark ? .white : .black) // Text color
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(.quaternary)
            .foregroundColor(colorScheme == .dark ? .white : .black) // Foreground color
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primary, lineWidth: 0.2)
            )
            .padding(.all, 7)
        }
    }
}
