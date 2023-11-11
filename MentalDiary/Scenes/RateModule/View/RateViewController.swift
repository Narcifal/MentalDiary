//
//  RateViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol RateViewProtocol: AnyObject {
    func updateEmotion(emotionImage: UIImage)
}

final class RateViewController: UIViewController {
    
    static func instantiate(with presenter: RatePresenterProtocol) -> RateViewController {
        let viewController: RateViewController = .instantiate(storyboard: .rate)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Properties -
    var presenter: RatePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet private weak var rateImageView: UIImageView!
    @IBOutlet private weak var rateSlider: UISlider!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        setupRateImageView()
        setupNextButton()
    }
    
    // MARK: - Private -
    private func setupRateImageView() {
        let cornerRadius = rateImageView.frame.size.width/2
        rateImageView.layer.cornerRadius = cornerRadius
        rateImageView.layer.cornerCurve = .continuous
        rateImageView.clipsToBounds = true
        rateImageView.backgroundColor = UIColor.gray
    }
    
    private func setupNextButton() {
        let cornerRadius: CGFloat = 25
        nextButton.layer.cornerRadius = cornerRadius
        nextButton.layer.cornerCurve = .continuous
    }
    
    @IBAction func rateSliderDidChange(_ sender: UISlider) {
        let index = Int(sender.value)
        presenter.sliderValueDidUpdate(by: index)
        
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        presenter.nextStepTapped()
    }
}

extension RateViewController: RateViewProtocol {
    func updateEmotion(emotionImage: UIImage) {
        rateImageView.image = emotionImage
    }
}
