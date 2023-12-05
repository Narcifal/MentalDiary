//
//  SceneDelegate.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        startRootScreen(for: windowScene)
    }
    
    func startRootScreen(for windowScene: UIWindowScene) {
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        let tabBarController = UITabBarController()
        let assembly = Assembly()
        let router = Router(tabBarController: tabBarController, assembly: assembly)
        
        router.setupTabBarController()

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

