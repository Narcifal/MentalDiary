//
//  ServicesPagePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 05.12.2023.
//

import Foundation

protocol ServicesPagePresenterProtocol {
    func backToHomeScreen()
    func startRequest()
}

final class ServicesPagePresenter: ServicesPagePresenterProtocol {
    
    //MARK: - Properties -
    
    private weak var view: ServicesPageView?
    private let router: RouterProtocol
    private let webViewUrlString: String
    
    // MARK: - Life Cycle -
    
    required init(router: RouterProtocol, webViewUrlString: String) {
        self.router = router
        self.webViewUrlString = webViewUrlString
    }
    
    // MARK: - Internal -
    
    func inject(view: ServicesPageView) {
        self.view = view
    }
    
    func backToHomeScreen() {
        router.backToTabBarTapped()
    }
    
    func startRequest() {
        if let url = URL(string: webViewUrlString) {
            DispatchQueue.global(qos: .userInitiated).async {
                let request = URLRequest(url: url)
                
                self.view?.loadWebPage(with: request)
            }
        }
    }
}
