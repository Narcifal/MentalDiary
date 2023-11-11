//
//  ProfilePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {}

final class ProfilePresenter: ProfilePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: ProfileViewProtocol?
    private let router: RouterProtocol
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: ProfileViewProtocol) {
        self.view = view
    }
    
}
