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

public enum NotificationKey: String {
    case showBottomBar
    case showShareSheet
    case openURL
    case fcmToken
    
    var name: NSNotification.Name {
        switch self {
        case .showBottomBar: return .showBottomBar
        case .showShareSheet: return .showShareSheet
        case .openURL: return .openURL
        case .fcmToken: return .fcmToken
        }
    }
}

public struct NotificationCenterManager {
    public static func send(_ key: NotificationKey, value: String) {
        print("NotificationCenterManager will send key: \(key) value: \(value)")
        NotificationCenter.default.post(name: key.name, object: self, userInfo: [key: value])
    }
    
    public static func send(_ key: NotificationKey, value: Bool) {
        print("NotificationCenterManager will send key: \(key) value: \(value)")
        NotificationCenter.default.post(name: key.name, object: self, userInfo: [key: value])
    }
}
