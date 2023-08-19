//
//  NotificationCenterKey.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/18.
//

import Foundation

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
