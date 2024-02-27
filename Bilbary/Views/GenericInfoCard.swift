//
//  GenericInfoCard.swift
//  Bilbary for iPad & macOS
//
//  Created by Luca Gargiulo on 26/02/24.
//

import SwiftUI

struct GenericInfoCard: View {
    let onTap: () -> Void

    var title: String
    var subTitle: String
    var contentText: String
    var nameImage: String
    var number: Int

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: nameImage)

                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                    Text(subTitle)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                }
                Spacer()
            }
            Text(contentText)
                .padding(.top, 10)
        }
        .padding(14)
        .background(.quaternary)
        .cornerRadius(12)
        .padding([.horizontal, .vertical])
        .onTapGesture {
            onTap()
        }
        customButton(title: title, subtitle: subTitle, contentText: contentText, lineStrokeWidth: 12, numberCircle: number, action: {})
    }
    
    func customButton(title: String, subtitle: String, contentText: String, lineStrokeWidth: CGFloat, numberCircle: Int, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                HStack {
                    
                    if numberCircle != 0 {
                        NumberCircle(number: numberCircle, maxNumber: 100, circleSize: 40, strokeWidth: 4, fontSize: 15)
                    }
                    else
                    {
                        ZStack {
                            Rectangle()
                                .fill(colorScheme == .dark ? Color.gray.opacity(0.07) : Color.white) // Background color
                                .frame(width: 40, height: 40) // Square dimensions
                            
                            Image(systemName: nameImage)
                                .foregroundColor(colorScheme == .dark ? .white : .black) // Image color
                        }
                        .shadow(radius: 10)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .foregroundColor(colorScheme == .dark ? .white : .black) // Title color
                            .bold()
                            .font(.system(size: 25))
                        Text(subtitle)
                            .foregroundColor(colorScheme == .dark ? Color.white.opacity(0.6) : Color.black.opacity(0.6)) // Subtitle color
                            .bold()
                            .font(.custom("New York", size: 18))
                    }
                    Spacer()
                }
                
                if contentText != ""
                {
                    Text(contentText)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(16)
            .background(.quaternary)
            .cornerRadius(18)
        }
        .buttonStyle(PlainButtonStyle())

    }
}

// PreviewProvider
struct GenericInfoCard_Previews: PreviewProvider {
    static var previews: some View {
        GenericInfoCard(onTap: {
        }, title: "title", subTitle: "subTitle", contentText: "This is a test content", nameImage: "heart", number: 0)
        .background(Color.black)
    }
}
