//
//  AppDIContainer.swift
//  Draw-iOS
//
//  Created by 송영모 on 2023/07/26.
//

import Foundation

protocol AppDIContainerInterface {
    func tabBarDependencies() -> TabBarViewModel
}

final class AppDIContainer: AppDIContainerInterface {
    func tabBarDependencies() -> TabBarViewModel {
        let viewModel: TabBarViewModel = .init()
        
        return viewModel
    }
}
