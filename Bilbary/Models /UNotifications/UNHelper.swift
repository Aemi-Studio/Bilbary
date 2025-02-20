//
//  UNHelper.swift
//  iits
//
//  Created by Guillaume Coquard on 20/02/24.
//

import Foundation
import UserNotifications
import OSLog

@Observable
final class UNHelper {

    static let shared: UNHelper = .init()

    public internal(set) var access: Bool = false

    internal let center: UNUserNotificationCenter = .current()
    internal let logger: Logger = .notifications

    private init() {
        Task {
            await self.updateAccess()
        }
    }

    deinit {
    }

    internal func updateAccess(request: Bool = false) async {

        self.logger.debug("Updating Notification Access")

        var access: Bool = true

        if request {
            self.logger.debug("Requesting Notification Access")
            do {
                access = try await self.center.requestAuthorization(
                    options: [
                        .alert,
                        .badge,
                        .sound
                    ]
                )
                self.logger.debug("Notification Request Access Result: \(access.description)")
            } catch {
                self.logger.error("\(String(describing: error))")
            }
        }

        let settings = await self.center.notificationSettings()

        access = access && ((settings.authorizationStatus == .authorized)
                                || (settings.authorizationStatus == .provisional))

        self.access = access

        guard access else {
            self.logger.debug("Notifications are not available.")
            return
        }

        if settings.alertSetting == .enabled {
            self.logger.debug("Alert-Only Notifications available.")
        } else {
            self.logger.debug("Notifications with badge & sound available.")
        }
    }

}
