//
//  HomePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import Foundation

protocol HomePresenterProtocol {
    var articlesList: [ArticleCollectionViewCell] { get }
    func routeToRateScreen()
    func routeToProfileScreen()
}

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: HomeViewProtocol?
    private let router: RouterProtocol
    private(set) var articlesList: [ArticleCollectionViewCell] = [
        ArticleCollectionViewCell(),
        ArticleCollectionViewCell(),
        ArticleCollectionViewCell(),
        ArticleCollectionViewCell()
    ]
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: HomeViewProtocol) {
        self.view = view
    }
    
    func routeToRateScreen() {
        router.routeToRateScreen()
    }
    
    func routeToProfileScreen() {
        router.routeToProfileScreen()
    }
}
