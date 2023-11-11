//
//  SharePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import Foundation

protocol SharePresenterProtocol: AnyObject {}

final class SharePresenter: SharePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: ShareViewProtocol?
    private let router: RouterProtocol
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: ShareViewProtocol) {
        self.view = view
    }
    
}
