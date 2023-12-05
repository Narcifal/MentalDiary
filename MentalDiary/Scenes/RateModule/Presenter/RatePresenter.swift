//
//  RatePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol RatePresenterProtocol: AnyObject {
    func sliderValueDidUpdate(by index: Int)
    func viewDidLoad()
    func nextStepTapped()
    func backButtonTapped()
}

final class RatePresenter: RatePresenterProtocol {

    private enum Constant {
        static let startEmotionIndex = 4
    }
    
    //MARK: - Properties -
    private weak var view: RateViewProtocol?
    private let router: RouterProtocol
    private let navigationController: UINavigationController
    private let emotions = [
        Asset.angryEmotion.image,
        Asset.sadEmotion.image,
        Asset.disgustEmotion.image,
        Asset.fearEmotion.image,
        Asset.happyEmotion.image,
        Asset.surpriseEmotion.image
    ]
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol, navigationController: UINavigationController) {
        self.router = router
        self.navigationController = navigationController
    }
    
    // MARK: - Iternal -
    func inject(view: RateViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        let emotionState = Emotion.state(index: Constant.startEmotionIndex).getState
        view?.updateEmotion(emotion: emotionState)
    }
    
    func sliderValueDidUpdate(by index: Int) {
        let emotionState = Emotion.state(index: index).getState
        view?.updateEmotion(emotion: emotionState)
    }
    
    func nextStepTapped() {
        router.routeToShareScreen(navigationController: navigationController)
    }
    
    func backButtonTapped() {
        router.backToTabBarTapped()
    }
}
