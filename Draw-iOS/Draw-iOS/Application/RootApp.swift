//
//  Draw_iOSApp.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

import ComposableArchitecture

@main
struct RootApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(initialState: RootStore.State()) {
                RootStore()._printChanges()
            })
        }
    }
}
