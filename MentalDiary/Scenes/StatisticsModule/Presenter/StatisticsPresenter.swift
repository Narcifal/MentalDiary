//
//  StatisticsPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import Foundation

protocol StatisticsPresenterProtocol: AnyObject {

}

final class StatisticsPresenter: StatisticsPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: StatisticsViewProtocol?
    private let router: RouterProtocol
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: StatisticsViewProtocol) {
        self.view = view
    }
    
}
