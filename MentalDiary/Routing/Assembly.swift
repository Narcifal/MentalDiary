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
    func createRateViewController(
        router: RouterProtocol,
        navigationController: UINavigationController
    ) -> UIViewController
    func createProfileViewController(router: RouterProtocol) -> UIViewController
    func createShareViewController(
        router: RouterProtocol,
        navigationController: UINavigationController,
        mentalHealthRate: Int
    ) -> UIViewController
    func createStatisticsViewController(router: RouterProtocol) -> UIViewController
    func createServicesPageViewController(router: RouterProtocol, webViewUrl: String) -> UIViewController
}

final class Assembly: AssemblyProtocol {
    @MainActor
    private let notesDatabase = NotesDatabase()
    
    // MARK: - Iternal -
    func createHomeViewController(router: RouterProtocol) -> UIViewController {
        let presenter = HomePresenter(router: router)
        let viewController = Storyboard.Home.homeViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.presenter = presenter
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
        viewController.presenter = presenter
        viewController.tabBarItem = UITabBarItem(
            title: "Media",
            image: UIImage(systemName: "film"),
            selectedImage: nil
        )
        return viewController
    }
    
    ///
    func createStatisticsViewController(router: RouterProtocol) -> UIViewController {
        let presenter = StatisticsPresenter(router: router, notesDatabase: notesDatabase)
        let viewController = Storyboard.Statistics.statisticsViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.presenter = presenter
        viewController.tabBarItem = UITabBarItem(
            title: "Statistic",
            image: UIImage(systemName: "waveform.path.ecg"),
            selectedImage: nil
        )
        return viewController
    }
    
    func createProfileViewController(router: RouterProtocol) -> UIViewController {
        let presenter = ProfilePresenter(router: router)
        let viewController = Storyboard.Profile.profileViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
    func createServicesPageViewController(router: RouterProtocol, webViewUrl: String) -> UIViewController {
        let presenter = ServicesPagePresenter(router: router, webViewUrlString: webViewUrl)
        let viewController = ServicesPageViewControler(presenter: presenter)
        presenter.inject(view: viewController)
        return viewController
    }
    
    func createShareViewController(
        router: RouterProtocol,
        navigationController: UINavigationController,
        mentalHealthRate: Int
    ) -> UIViewController {
        let presenter = SharePresenter(
            router: router,
            navigationController: navigationController,
            notesDatabase: notesDatabase,
            mentalHealthRate: mentalHealthRate
        )
        let viewController = Storyboard.Share.shareViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
    
    func createRateViewController(
        router: RouterProtocol,
        navigationController: UINavigationController
    ) -> UIViewController {
        let presenter = RatePresenter(
            router: router,
            navigationController: navigationController
        )
        let viewController = Storyboard.Rate.rateViewController.instantiate()
        presenter.inject(view: viewController)
        viewController.presenter = presenter
        return viewController
    }
}

