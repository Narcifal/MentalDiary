//
//  MediaPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import Foundation

protocol MediaPresenterProtocol: AnyObject {}

final class MediaPresenter: MediaPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: MediaViewProtocol?
    private let router: RouterProtocol
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: MediaViewProtocol) {
        self.view = view
    }
    
}
