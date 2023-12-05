//
//  HomePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import Foundation

protocol HomePresenterProtocol {
    func routeToRateScreen()
    func routeToProfileScreen()
    func getServicesListCount() -> Int
    func getServicesListItem(at index: Int) -> RecommendedService
}

final class HomePresenter: HomePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: HomeViewProtocol?
    private let router: RouterProtocol
    private let servicesList: [RecommendedService] = MockFactory.topThreeServices
    
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
    
    func getServicesListCount() -> Int {
        servicesList.count
    }
    
    func getServicesListItem(at index: Int) -> RecommendedService {
        servicesList[index]
    }
}
