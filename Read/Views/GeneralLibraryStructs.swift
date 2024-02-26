//
//  GeneralLibraryStructs.swift
//  Read for iPad & macOS
//
//  Created by Luca Gargiulo on 26/02/24.
//

import SwiftUI

struct CustomHStack: View {
    @Binding var viewOption: Int

    var body: some View {
        HStack {
            Image(systemName: "gear")
                .padding(.top, 15)
                .padding(.horizontal, 30)

            Picker("", selection: $viewOption) {
                Text("History").tag(0)
                Text("Likes").tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.top, 15)

            Image(systemName: "bubble.left.and.text.bubble.right")
                .padding(.top, 15)
                .padding(.horizontal, 30)
        }
        .padding(.bottom, 10) // Add bottom padding to separate from content above
        .background(Color.white)
    }
}

struct CustomButton: View {
    var action: () -> Void

    var nameImage: String
    var text: String

    var body: some View {
        Button(action: action) {
            HStack {
                if nameImage != "" {
                    Image(systemName: nameImage)
                }

                if text != "" {
                    Text(text)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color.blue)
            .foregroundColor(.white)
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

    var body: some View {
        let trimValue = CGFloat(number) / CGFloat(maxNumber)

        return ZStack {
            Circle()
                .trim(from: 0, to: trimValue)
                .stroke(Color.black, lineWidth: strokeWidth) // Customize stroke color and width
                .frame(width: circleSize, height: circleSize)
                .rotationEffect(.degrees(-90)) // Rotate the circle to start from top

            Text("\(number)")
                .foregroundColor(.black) // Customize text color as needed
                .font(.system(size: fontSize, weight: .semibold))
        }
    }
}
