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
    
    // MARK: - Iternal -
    func inject(view: ProfileViewProtocol) {
        self.view = view
    }
    
}
