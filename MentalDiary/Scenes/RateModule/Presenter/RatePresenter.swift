//
//  RatePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import Foundation

protocol RatePresenterProtocol: AnyObject {
    func sliderValueDidUpdate(by index: Int)
    func viewDidLoad()
    func nextStepTapped()
}

final class RatePresenter: RatePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: RateViewProtocol?
    private let router: RouterProtocol
    private let emotions = [
        Asset.angryEmotion.image,
        Asset.sadEmotion.image,
        Asset.disgustEmotion.image,
        Asset.fearEmotion.image,
        Asset.happyEmotion.image,
        Asset.surpriseEmotion.image
    ]
    private let startEmotionIndex = 4
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: RateViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.updateEmotion(emotionImage: emotions[startEmotionIndex])
    }
    
    func sliderValueDidUpdate(by index: Int) {
        view?.updateEmotion(emotionImage: emotions[index])
    }
    
    func nextStepTapped() {
        router.routeToRateScreen()
    }
    
}
