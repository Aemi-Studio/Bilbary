//
//  OnePageOnboarding.swift
//  Bilbary for iPad & macOS
//
//  Created by Mikayla Kim on 25/02/24.
//

import SwiftUI

struct OnboardingView: View {

    @Environment(\.dismiss)
    private var dismiss: DismissAction

    @State
    private var view: BViewModel = .shared

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
                                OnboardingRow(
                                    title: "Scroll to Read More",
                                    subtitle: "Start small with a few sentences.\nAll you have to do is scroll if you like what you see.",
                                    systemName: "book.fill"
                                )
                                OnboardingRow(
                                    title: "Swipe for Different Content",
                                    subtitle: "We offer a variety of genres for you to choose from.\nAll you have to do is swipe.",
                                    systemName: "hand.draw.fill"
                                )
                                OnboardingRow(
                                    title: "Like for More",
                                    subtitle: "Like what you see? We will recommend more of it",
                                    systemName: "heart.fill"
                                )
                                OnboardingRow(
                                    title: "Cater to Your Liking",
                                    subtitle: "Customize your pace, time, and content",
                                    systemName: "slider.horizontal.3"
                                )
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
                            Label(
                                NSLocalizedString(
                                    "onboarding.continue",
                                    comment: "Continue text on onboarding button"
                                ),
                                systemImage: "arrow.forward"
                            )
                            .labelStyle(.titleOnly)
                            .foregroundStyle(.white)
                        }
                        .fontWeight(.medium)
                        .clipShape(.rect(cornerRadius: 10))
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
    OnboardingView()
}
