//
//  UserDefaultManager.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/08/18.
//

import Foundation

public struct UserDefaultManager {
    static func get(_ key: UserDefaultKey) -> String? {
        let value = UserDefaults.standard.object(forKey: key.rawValue) as? String
        print("UserDefaultManger did get key: \(key) value: \(value ?? "")")
        return value
    }
    
    static func post(_ key: UserDefaultKey, value: String) {
        print("UserDefaultManger will post key: \(key) value: \(value)")
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func remove(_ key: UserDefaultKey) {
        print("UserDefaultManger will remove key: \(key)")
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    static func removeAll() {
        UserDefaultKey.allCases.forEach { key in
            print("UserDefaultManger will remove key: \(key)")
            UserDefaults.standard.removeObject(forKey: key.rawValue)
        }
    }
}
