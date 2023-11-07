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
    
    // MARK: - Iternal -
    func inject(view: ShareViewProtocol) {
        self.view = view
    }
    
}
