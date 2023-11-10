//
//  Router.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

protocol RouterProtocol {
    func setupTabBarController()
}

final class Router: RouterProtocol {
    
    // MARK: - Properties -
    private var assembly: AssemblyProtocol
    private var tabBarController: UITabBarController?
    
    // MARK: - Life Cycle -
    init(tabBarController: UITabBarController, assembly: AssemblyProtocol) {
        self.tabBarController = tabBarController
        self.assembly = assembly
    }
    
    // MARK: - Iternal -
    func setupTabBarController() {
        let tabBarViewController = UITabBarController()
        let homeViewController = assembly.createHomeViewController(router: self)
        
        tabBarViewController.setViewControllers([homeViewController], animated: true)
        
        tabBarViewController.modalPresentationStyle = .fullScreen
        //self.present(tabBarViewController, animated: true)
    }
    
}
