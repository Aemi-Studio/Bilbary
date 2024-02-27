//
//  GeneralLibraryStructs.swift
//  Bilbary for iPad & macOS
//
//  Created by Luca Gargiulo on 26/02/24.
//

import SwiftUI

struct CustomHStack: View {
    @Binding var viewOption: Int

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack {
            Image(systemName: "gear")
                .padding(.top, 15)
                .padding(.horizontal, 30)
                .foregroundColor(colorScheme == .dark ? .white : .black)

            Picker("", selection: $viewOption) {
                Text("History").tag(0)
                Text("Likes").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.top, 15)

            Image(systemName: "bubble.left.and.text.bubble.right")
                .padding(.top, 15)
                .padding(.horizontal, 30)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        }
        .padding(.bottom, 10)
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

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
        }
    }
}

struct NumberCircle: View {
    let number: Int
    let maxNumber: Int
    let circleSize: CGFloat
    let strokeWidth: CGFloat
    let fontSize: CGFloat

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        let trimValue = CGFloat(number) / CGFloat(maxNumber)

        return ZStack {
            Circle()
                .trim(from: 0, to: trimValue)
                .stroke(Color.primary, lineWidth: strokeWidth) // Use primary color for stroke
                .frame(width: circleSize, height: circleSize)
                .rotationEffect(.degrees(-90)) // Rotate the circle to start from top

            Text("\(number)")
                .foregroundColor(colorScheme == .dark ? .white : .black) // Use white text color in dark mode
                .font(.system(size: fontSize, weight: .semibold))
        }
    }
}
