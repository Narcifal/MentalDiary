//
//  ProfilePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol ProfilePresenterProtocol: AnyObject {
    var genderList: [String] { get }
    var settingsList: [String] { get }
    func backButtonTapped()
    func profileEditTapped(sender: UIButton)
}

final class ProfilePresenter: ProfilePresenterProtocol {
    
    private enum Constant {
        
        static let titleEditButton = "Edit"
        static let titleSaveButton = "Save"
        
        enum Settings {
            static let titleContactSupport = "Contact Support"
            static let titleTermsAndCondition = "Terms & Condition"
            static let titleLogout = "Log out"
        }
        
        enum Gender {
            static let male = "M"
            static let female = "W"
        }
    }
    
    //MARK: - Properties -
    private weak var view: ProfileViewProtocol?
    private let router: RouterProtocol
    private(set) var genderList = [
        Constant.Gender.male,
        Constant.Gender.female
    ]
    private(set) var settingsList = [
        Constant.Settings.titleContactSupport,
        Constant.Settings.titleTermsAndCondition,
        Constant.Settings.titleLogout,
    ]
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: ProfileViewProtocol) {
        self.view = view
    }
    
    func backButtonTapped() {
        router.backToTabBarTapped()
    }
    
    func profileEditTapped(sender: UIButton) {
        changeEditButtonTitle(sender: sender)
    }
}

private extension ProfilePresenter {
    
    func changeEditButtonTitle(sender: UIButton) {
        if sender.titleLabel?.text == Constant.titleEditButton {
            sender.setTitle(Constant.titleSaveButton, for: .normal)
        } else {
            sender.setTitle(Constant.titleEditButton, for: .normal)
        }
    }
}
