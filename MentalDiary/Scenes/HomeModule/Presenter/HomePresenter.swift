//
//  HomePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import Foundation

protocol HomePresenterProtocol {}

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: HomeViewProtocol?
    private let router: RouterProtocol
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: HomeViewProtocol) {
        self.view = view
    }
    
}
