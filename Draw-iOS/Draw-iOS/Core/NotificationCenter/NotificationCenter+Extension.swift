//
//  NotificationCenter+Extension.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/31.
//

import Foundation

public extension NSNotification.Name {
    static let showBottomBar = Notification.Name(NotificationKey.showBottomBar.rawValue)
    static let showShareSheet = Notification.Name(NotificationKey.showShareSheet.rawValue)
    static let openURL = Notification.Name(NotificationKey.openURL.rawValue)
    static let fcmToken = Notification.Name(NotificationKey.fcmToken.rawValue)
}
