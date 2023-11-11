//
//  HomePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad()
    func routeToReport()
}

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
    
    func viewDidLoad() {
        updateDate()
    }
    
    func routeToReport() {
        router.routeToRateScreen()
    }
}

// MARK: - Private -
private extension HomePresenter {
    func updateDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, dd, yyyy"
        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        view?.updateDate(date: formattedDate)
    }
}
