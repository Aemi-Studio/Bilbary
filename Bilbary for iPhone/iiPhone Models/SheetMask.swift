//
//  SheetMask.swift
//  Bilbary for iPhone
//
//  Created by SHOHJAHON on 26/07/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func maskForSheet (mask: Bool = true, _ height: CGFloat = 0) -> some View {
        self
            .background(SheetRootViewFinder(mask: mask, height: height))
    }
}

// Helpers
private struct SheetRootViewFinder: UIViewRepresentable {
    var mask: Bool
    var height: CGFloat
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        UpdateMaskView(uiView)
    }

    func UpdateMaskView (_ uiView: UIViewType) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let rootView = uiView.viewBeforeWindow, let window =
                rootView.window {
                //                let safeArea = rootView.safeAreaInsets
                let newFrame = CGRect(
                    origin: .zero,
                    size: .init(width: window.frame.width, height: window.frame.height - (self.mask ? (height) : height + 0.1)
                    ))

                rootView.clipsToBounds = true
                rootView.frame = newFrame
                rootView.layoutIfNeeded()

            }

        }
    }
}

fileprivate extension UIView {
    var viewBeforeWindow: UIView? {
        if let superview, superview is UIWindow {
            return self
        }
        return superview?.viewBeforeWindow
    }

    var allSubViews: [UIView] {
        return subviews.flatMap { [ $0] + $0.subviews}
    }
}
