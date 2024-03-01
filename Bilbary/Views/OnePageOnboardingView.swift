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

        VStack(spacing: 32) {

            VStack {
                ScrollView {
                    VStack(spacing: 16) {
                        VStack(spacing: 32) {
                            Image("Icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 96, height: 96)
                                .clipShape(RoundedRectangle(cornerRadius: 96 * (2/9)))
                                .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 6)

                            Group {
                                Text(
                                    NSLocalizedString(
                                        "welcome.to.appName",
                                        comment: "Text displayed in the onboarding view"
                                    )
                                )
                                + Text(" \(Util.getAppName())")
                            }
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        }

                        VStack(spacing: 8) {
                            Group {
                                HStack(spacing: 18) {
                                    VStack {
                                        Image(systemName: "book.fill")
                                            .font(.largeTitle)
                                            .foregroundColor(.accentColor)
                                            .fontWeight(.regular)
                                    }
                                    .padding(.vertical)

                                    VStack(alignment: .leading) {
                                        Text("Scroll to Read More")
                                            .fontWeight(.bold)
                                            .font(.title2)

                                        Text("Start small with a few sentences.\nAll you have to do is scroll if you like what you see.")
                                            .font(.title3)
                                            .foregroundColor(.secondary)

                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                }
                                HStack(spacing: 18) {
                                    VStack {
                                        Image(systemName: "hand.draw.fill")
                                            .font(.largeTitle)
                                            .foregroundColor(.accentColor)
                                            .fontWeight(.regular)
                                    }
                                    .padding(.vertical)

                                    VStack(alignment: .leading) {
                                        Text("Swipe for Different Content")
                                            .fontWeight(.bold)
                                            .font(.title2)

                                        Text("We offer a variety of genres for you to choose from.\nAll you have to do is swipe.")
                                            .font(.title3)
                                            .foregroundColor(.secondary)

                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                }
                                HStack(spacing: 18) {
                                    VStack {
                                        Image(systemName: "heart.fill")
                                            .font(.largeTitle)
                                            .foregroundColor(.accentColor)
                                            .fontWeight(.regular)
                                    }
                                    .padding(.vertical)

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
                                HStack(spacing: 18) {
                                    VStack {
                                        Image(systemName: "slider.horizontal.3")
                                            .font(.largeTitle)
                                            .foregroundColor(.accentColor)
                                            .fontWeight(.regular)
                                    }
                                    .padding(.vertical)

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
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                        }
                        .padding(.vertical, 20)
                        .padding(.horizontal, 32)
                    }
                    .padding(.top, 80)
                    .padding(.horizontal, 24)
                }
                Spacer()
                Button {
                    view.displayOnboarding = false
                    dismiss()
                } label: {
                    Text("Continue")
                        .padding()
                        .padding(.horizontal, 16)
                        .background(Color.accentColor)
                        .overlay {
                            Label("Continue", systemImage: "arrow.forward")
                                .labelStyle(.titleOnly)
                                .foregroundStyle(.white)
                        }
                        .fontWeight(.medium)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .font(.title2)
                }
                .buttonStyle(.plain)
                .padding(32)
            }
            .padding([.bottom, .horizontal])
        }

    }

}

#Preview {
    OnePageOnboardingView()
}
