//
//  OnePageOnboarding.swift
//  Bilbary for iPad & macOS
//
//  Created by Mikayla Kim on 25/02/24.
//

import SwiftUI

struct OnePageOnboardingView: View {

    @Environment(\.dismiss)
    private var dismiss: DismissAction

    @State
    private var view: RViewModel = .shared

    var body: some View {

        VStack {
            Spacer()

            VStack {

                Image(" ")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .fontWeight(.heavy)

                Text("Welcome to Read")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.top, 10)

            }

            VStack {

                HStack {
                    Spacer(minLength: 50)
                    Image(systemName: "book.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .fontWeight(.regular)
                        .padding()

                    VStack(alignment: .leading) {
                        Text("Scroll to Read More")
                            .fontWeight(.bold)
                            .font(.title2)

                        Text("Start small with a few sentences. All you have to do is scroll if you like what you see.")
                            .font(.title3)
                            .foregroundColor(.secondary)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding()
                .frame(maxWidth: .infinity)

                HStack {
                    Spacer(minLength: 50)
                    Image(systemName: "hand.draw.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .fontWeight(.regular)
                        .padding()

                    VStack(alignment: .leading) {
                        Text("Swipe for Different Content")
                            .fontWeight(.bold)
                            .font(.title2)

                        Text("We offer a variety of genres for you to choose from. All you have to do is swipe.")
                            .font(.title3)
                            .foregroundColor(.secondary)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding()
                .frame(maxWidth: .infinity)
                HStack {
                    Spacer(minLength: 50)
                    Image(systemName: "heart.fill")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .fontWeight(.regular)
                        .padding()

                    VStack(alignment: .leading) {
                        Text("Like for More")
                            .fontWeight(.bold)
                            .font(.title2)

                        Text("Like what you see? We will recommend more of it")
                            .font(.title3)
                            .foregroundColor(.secondary)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding()
                .frame(maxWidth: .infinity)

                HStack {
                    Spacer(minLength: 50)
                    Image(systemName: "slider.horizontal.3")
                        .font(.largeTitle)
                        .foregroundColor(.accentColor)
                        .fontWeight(.regular)
                        .padding()

                    VStack(alignment: .leading) {
                        Text("Cater to Your Liking")
                            .fontWeight(.bold)
                            .font(.title2)

                        Text("Customize your pace, time, and content")
                            .font(.title3)
                            .foregroundColor(.secondary)

                    }
                    .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding()
                .frame(maxWidth: .infinity)

            }
            .padding(.vertical, 20)

            Button {
                view.displayOnboarding = false
                dismiss()
            } label: {
                Text("Continue")
                    .padding(.vertical, 20)
                    .padding(.horizontal, 180)
                    .foregroundStyle(Color("BackgroundColor"))
                    .background(Color("ForegroundColor"))
                    .cornerRadius(12)
                    .fontWeight(.bold)
                    .font(.subheadline)
            }
            .padding(10)

            Spacer()

        }
        .padding()

    }

}
