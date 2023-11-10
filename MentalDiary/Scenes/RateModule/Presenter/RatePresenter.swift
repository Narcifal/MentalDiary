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
    
    // MARK: - Iternal -
    func inject(view: RateViewProtocol) {
        self.view = view
    }
    
}
