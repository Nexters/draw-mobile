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
}

public enum NotificationKey: String {
    case showBottomBar
    case showShareSheet
}

public struct NotificationCenterManager {
    public static func send(_ key: NotificationKey, value: Bool) {
        NotificationCenter.default.post(name: .showBottomBar, object: self, userInfo: [key: value])
    }
}
