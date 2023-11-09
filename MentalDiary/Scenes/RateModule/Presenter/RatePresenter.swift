//
//  RatePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import Foundation

protocol RatePresenterProtocol: AnyObject {}

final class RatePresenter: RatePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: RateViewProtocol?
    private let router: RouterProtocol
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: RateViewProtocol) {
        self.view = view
    }
    
}
