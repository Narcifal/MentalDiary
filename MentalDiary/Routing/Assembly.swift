//
//  Assembly.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 18.09.2023.
//

import UIKit

protocol AssemblyProtocol {
    func createHomeViewController(router: RouterProtocol) -> UIViewController
}

final class Assembly: AssemblyProtocol {
    
    // MARK: - Iternal -
    func createHomeViewController(router: RouterProtocol) -> UIViewController {
        let presenter = HomePresenter(router: router)
        let viewController = HomeViewController.instantiate(with: presenter)
        presenter.inject(view: viewController)
        viewController.title = Localized.homeTitle
        return viewController
    }
    
}

