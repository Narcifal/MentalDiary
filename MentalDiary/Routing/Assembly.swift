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
    func createRateViewController(router: RouterProtocol) -> UIViewController
    func createProfileViewController(router: RouterProtocol) -> UIViewController
    func createShareViewController(router: RouterProtocol) -> UIViewController
}

final class Assembly: AssemblyProtocol {
    // MARK: - Iternal -
    func createHomeViewController(router: RouterProtocol) -> UIViewController {
        let presenter = HomePresenter(router: router)
        let viewController = Storyboard.Home.homeViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: nil
        )
        return viewController
    }
    
    func createMediaViewController(router: RouterProtocol) -> UIViewController {
        let presenter = MediaPresenter(router: router)
        let viewController = Storyboard.Media.mediaViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.tabBarItem = UITabBarItem(
            title: "Media",
            image: UIImage(systemName: "film"),
            selectedImage: nil
        )
        return viewController
    }
    
    func createProfileViewController(router: RouterProtocol) -> UIViewController {
        let presenter = ProfilePresenter(router: router)
        let viewController = Storyboard.Profile.profileViewController.instantiate()
        presenter.inject(view: viewController)
        return viewController
    }
    
    func createShareViewController(router: RouterProtocol) -> UIViewController {
        let presenter = SharePresenter(router: router)
        let viewController = Storyboard.Share.shareViewController.instantiate()
        presenter.inject(view: viewController)
        return viewController
    }
    
    func createRateViewController(router: RouterProtocol) -> UIViewController {
        let presenter = RatePresenter(router: router)
        let viewController = Storyboard.Rate.rateViewController.instantiate()
        presenter.inject(view: viewController)
        return viewController
    }
}

