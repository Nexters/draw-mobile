//
//  NotificationCenterManager.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/18.
//

import Foundation

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
