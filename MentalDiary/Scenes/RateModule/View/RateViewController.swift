//
//  RateViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol RateViewProtocol: AnyObject {
    func updateEmotion(emotion: EmotionGroup)
}

final class RateViewController: UIViewController {
    
    private enum Constant {
        static let progress: Float = 0.5
        static let backButtonTitle = "Back"
        static let backButtonImage = "chevron.left"
        static let cornerRadiusButton: CGFloat = 25
    }
    
    // MARK: - Properties -
    var presenter: RatePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var rateStateLabel: UILabel!
    @IBOutlet private weak var rateImageView: UIImageView!
    @IBOutlet private weak var rateSlider: UISlider!
    @IBOutlet private weak var nextButton: UIButton!
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: Constant.backButtonImage)
        button.target = self
        button.action = #selector(backButtonTapped)
        return button
    }()
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = backButton
        progressBar.progress = Constant.progress
        
        presenter.viewDidLoad()
        setupRateImageView()
        setupNextButton()
    }
    
    @objc func backButtonTapped() {
        presenter.backButtonTapped()
    }
    
    @IBAction func rateSliderDidChange(_ sender: UISlider) {
        let index = Int(sender.value)
        presenter.sliderValueDidUpdate(by: index)
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        presenter.nextStepTapped()
    }
}

private extension RateViewController {
    
    func setupRateImageView() {
        let cornerRadius = rateImageView.frame.size.width/2
        rateImageView.layer.cornerRadius = cornerRadius
        rateImageView.layer.cornerCurve = .continuous
        rateImageView.clipsToBounds = true
        rateImageView.backgroundColor = UIColor.gray
    }
    
    func setupNextButton() {
        nextButton.layer.cornerRadius = Constant.cornerRadiusButton
        nextButton.layer.cornerCurve = .continuous
    }
}

extension RateViewController: RateViewProtocol {
    func updateEmotion(emotion: EmotionGroup) {
        rateImageView.image = emotion.image
        rateStateLabel.text = emotion.title
        rateSlider.tintColor = emotion.color
        rateSlider.thumbTintColor = emotion.color
    }
}
