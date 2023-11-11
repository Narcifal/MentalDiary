//
//  SharePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol SharePresenterProtocol: AnyObject { }

final class SharePresenter: SharePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: ShareViewProtocol?
    private let router: RouterProtocol
    private let navigationController: UINavigationController
//    private lazy var backButton: UIBarButtonItem = {
//        let button = UIBarButtonItem()
//        button.image = UIImage(systemName: Constant.backButtonImage)
//        button.target = self
//        return button
//    }()
        
    // MARK: - Life Cycle -
    required init(
        router: RouterProtocol,
        navigationController: UINavigationController
    ) {
        self.router = router
        self.navigationController = navigationController
    }
    
    // MARK: - Iternal -
    func inject(view: ShareViewProtocol) {
        self.view = view
    }
    
}
