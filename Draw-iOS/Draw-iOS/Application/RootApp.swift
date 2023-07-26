//
//  Draw_iOSApp.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import SwiftUI

@main
struct RootApp: App {
    let appDIContainer: AppDIContainerInterface = AppDIContainer()
    
    var body: some Scene {
        WindowGroup {
            TabBarView(viewModel: appDIContainer.tabBarDependencies())
        }
    }
}
