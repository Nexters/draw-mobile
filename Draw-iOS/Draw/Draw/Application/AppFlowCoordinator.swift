//
//  AppFlowCoordinator.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import UIKit

final class AppFlowCoordinator {

    var tabBarController: UITabBarController
    private let appDIContainer: AppDIContainer
    
    init(
        tabBarController: UITabBarController,
        appDIContainer: AppDIContainer
    ) {
        self.tabBarController = tabBarController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let tabBarDIContainer = appDIContainer.makeTabBarDIContainer()
        let flow = tabBarDIContainer.makeTabBarFlowCoordinator(
            tabBarController: tabBarController
        )
        flow.start()
    }
}

