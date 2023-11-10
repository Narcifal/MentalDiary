//
//  Assembly.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 18.09.2023.
//

import UIKit

protocol AssemblyProtocol {
    func createHomeViewController(router: RouterProtocol) -> UIViewController
    func createMediaViewController(router: RouterProtocol) -> UIViewController
}

final class Assembly: AssemblyProtocol {
    
    // MARK: - Iternal -
    func createHomeViewController(router: RouterProtocol) -> UIViewController {
        let presenter = HomePresenter(router: router)
        let viewController = Storyboard.Home.homeViewController.instantiate()
        presenter.inject(view: viewController)
        return viewController
    }
    
    func createMediaViewController(router: RouterProtocol) -> UIViewController {
        let presenter = MediaPresenter(router: router)
        let viewController = Storyboard.Media.mediaViewController.instantiate()
        presenter.inject(view: viewController)
        return viewController
    }
    
}

