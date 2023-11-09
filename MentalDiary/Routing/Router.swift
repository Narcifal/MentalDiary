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
    private var assembly: AssemblyProtocol
    private weak var tabBarController: UITabBarController?

    init(tabBarController: UITabBarController, assembly: AssemblyProtocol) {
        self.tabBarController = tabBarController
        self.assembly = assembly
    }

    func setupTabBarController() {
        let homeViewController = assembly.createHomeViewController(router: self)
        let mediaViewController = assembly.createMediaViewController(router: self)

        // Создайте массив ваших контроллеров
        let viewControllers = [homeViewController, mediaViewController]

        // Установите контроллеры в качестве вкладок таббара
        tabBarController?.setViewControllers(viewControllers, animated: false)
    }
}
