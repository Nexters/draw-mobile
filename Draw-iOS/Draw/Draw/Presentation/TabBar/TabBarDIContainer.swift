//
//  TabBarDIContainer.swift
//  Draw
//
//  Created by 송영모 on 2023/07/24.
//

import UIKit

final class TabBarDIContainer: TabBarFlowCoordinatorDependencies {
    
    struct Dependencies {
        let appConfiguration: AppConfiguration
    }

    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeHomeViewController() -> HomeViewController {
        HomeViewController()
    }
    
    // MARK: - Flow Coordinators
    func makeTabBarFlowCoordinator(tabBarController: DrawTabBarController) -> TabBarFlowCoordinator {
        TabBarFlowCoordinator(
            tabBarController: tabBarController,
            dependencies: self
        )
    }

//    // MARK: - Use Cases
//    func makeFetchTrendingRepositoriesUseCase() -> FetchTrendingRepositoriesUseCase {
//        DefaultFetchTrendingRepositoriesUseCase(
//            trendingRepositoriesRepository: makeTrendingRepositoriesRepository()
//        )
//    }

    // MARK: - Trending Repositories List
    
//    func makeTrendingRepositoriesListViewModel() -> TrendingRepositoriesListViewModel {
//        DefaultTrendingRepositoriesListViewModel(
//            fetchTrendingRepositoriesUseCase: makeFetchTrendingRepositoriesUseCase(),
//            mainQueue: DispatchQueue.main
//        )
//    }
    
//    func makeTrendingRepositoriesListViewController() -> TrendingRepositoriesListViewController {
//        TrendingRepositoriesListViewController(
//            viewModel: makeTrendingRepositoriesListViewModel(),
//            imagesRepository: makeImagesRepository()
//        )
//    }
//
//    // MARK: - Flow Coordinators
//    func makeTrendingRepositoriesFlowCoordinator(navigationController: UINavigationController) -> TrendingRepositoriesFlowCoordinator {
//        TrendingRepositoriesFlowCoordinator(
//            navigationController: navigationController,
//            dependencies: self
//        )
//    }
}
