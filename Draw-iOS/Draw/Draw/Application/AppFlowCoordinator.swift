//
//  AppFlowCoordinator.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import UIKit

final class AppFlowCoordinator {

    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }

    func start() {
        let trendingTrendingRepositoriesFeatureDIContainer = appDIContainer.makeTrendingRepositoriesFeatureDIContainer()
        let flow = trendingTrendingRepositoriesFeatureDIContainer.makeTrendingRepositoriesFlowCoordinator(
            navigationController: navigationController
        )
        flow.start()
    }
}

