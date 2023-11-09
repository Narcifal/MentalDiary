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
        let statisticViewController = assembly.createStatisticViewController(router: self)

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
    
    func routeToRateScreen() {
    
    }
    
    @objc 
    func backButtonTapped() {
        tabBarController?.dismiss(animated: true, completion: nil)
    }
}
