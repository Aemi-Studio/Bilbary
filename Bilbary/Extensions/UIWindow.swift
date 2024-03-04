//
//  UIWindow.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import SwiftUI

extension UIWindow {

    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows where window.isKeyWindow {
                return window
            }
        }
        return nil
    }

    static var width: CGFloat {
        self.current?.screen.bounds.width ?? UIScreen.main.bounds.width
    }

    static var height: CGFloat {
        self.current?.screen.bounds.height ?? UIScreen.main.bounds.height
    }

}
