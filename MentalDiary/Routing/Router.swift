//
//  Router.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

protocol RouterProtocol {
    func setupTabBarController()
    func routeToRateScreen()
    func routeToShareScreen(navigationController: UINavigationController, mentalHealthRate: Int)
    func routeToProfileScreen()
    func backToTabBarTapped()
    func back(navigationController: UINavigationController, animated: Bool)
}

final class Router: RouterProtocol {
    private var assembly: AssemblyProtocol
    private weak var tabBarController: UITabBarController?

    init(tabBarController: UITabBarController, assembly: AssemblyProtocol) {
        self.tabBarController = tabBarController
        self.assembly = assembly
        tabBarController.tabBar.tintColor = Asset.pureGreen.color
    }

    func setupTabBarController() {
        let homeViewController = assembly.createHomeViewController(router: self)
        let mediaViewController = assembly.createMediaViewController(router: self)
        let statisticViewController = assembly.createStatisticsViewController(router: self)

        let viewControllers = [
            statisticViewController,
            homeViewController,
            mediaViewController
        ]
        
        tabBarController?.setViewControllers(viewControllers, animated: false)
        
        if let homeViewControllerIndex = viewControllers.firstIndex(where: { $0 is HomeViewController }) {
              tabBarController?.setViewControllers(viewControllers, animated: false)
              tabBarController?.selectedIndex = homeViewControllerIndex
        } 
    }
}

extension Router {
    
    func routeToRateScreen() {
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.tintColor = .black
        
        let rateModule = assembly.createRateViewController(
            router: self,
            navigationController: navigationController
        )

        navigationController.setViewControllers([rateModule], animated: true)
        tabBarController?.present(navigationController, animated: true, completion: nil)
    }
    
    func routeToShareScreen(navigationController: UINavigationController,
                            mentalHealthRate: Int) {
        let shareModule = assembly.createShareViewController(
            router: self,
            navigationController: navigationController, 
            mentalHealthRate: mentalHealthRate
        )
        
        navigationController.pushViewController(shareModule, animated: false)
    }
    
    func routeToProfileScreen() {
        let profileModule = assembly.createProfileViewController(router: self)
        profileModule.modalPresentationStyle = .fullScreen
        
        tabBarController?.present(profileModule, animated: true, completion: nil)

    }
    
    func backToTabBarTapped() {
        tabBarController?.dismiss(animated: true, completion: nil)
    }
    
    func back(navigationController: UINavigationController, animated: Bool) {
        navigationController.popViewController(animated: true)
    }
}
