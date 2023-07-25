//
//  SceneDelegate.swift
//  Draw
//
//  Created by 송영모 on 2023/07/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let tabBarController = DrawTabBarController()

        window.rootViewController = tabBarController
        appFlowCoordinator = AppFlowCoordinator(
            tabBarController: tabBarController,
            appDIContainer: appDIContainer
        )
        appFlowCoordinator?.start()
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
//        CoreDataStorage.shared.saveContext()
//        CoreDataImagesStorage.removeLeastRecentlyUsedImages()
    }
}
