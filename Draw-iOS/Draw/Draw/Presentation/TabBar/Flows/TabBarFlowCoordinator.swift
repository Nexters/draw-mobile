//
//  TabBarFlowCoordinator.swift
//  Draw
//
//  Created by 송영모 on 2023/07/24.
//

import UIKit

protocol TabBarFlowCoordinatorDependencies {
//    func makeTabBarFlowCoordinator() -> TabBarFlowCoordinator
    func makeHomeViewController() -> HomeViewController
}

final class TabBarFlowCoordinator {
    
    private weak var tabBarController: UITabBarController?
    private let dependencies: TabBarFlowCoordinatorDependencies

    init(
        tabBarController: UITabBarController,
        dependencies: TabBarFlowCoordinatorDependencies
    ) {
        self.tabBarController = tabBarController
        self.dependencies = dependencies
    }
    
    func start() {
        let homeViewController = dependencies.makeHomeViewController()
        
        tabBarController?.viewControllers = [homeViewController]
        
        tabBarController?.selectedIndex = 0
        
//        let viewController =  dependencies.makeTrendingRepositoriesListViewController()
//        tabBarController.
//        navigationController?.pushViewController(viewController, animated: false)
    }
}

