//
//  RateViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol RateViewProtocol: AnyObject {}

final class RateViewController: UIViewController {
    
    static func instantiate(with presenter: RatePresenterProtocol) -> RateViewController {
        let viewController: RateViewController = .instantiate(storyboard: .rate)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Properties -
    private var presenter: RatePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet private weak var rateImageView: UIImageView!
    @IBOutlet private weak var rateSlider: UISlider!
    @IBOutlet private weak var nextButton: UIButton!
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        rateImageView.image = UIImage(named: "happy")
    }
    
    private func setupNextButton() {
        let cornerRadius: CGFloat = 25
        nextButton.layer.cornerRadius = cornerRadius
        nextButton.layer.cornerCurve = .continuous
    }
    
    @IBAction func rateSliderDidChange(_ sender: UISlider) {
        
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
    }
}

extension RateViewController: RateViewProtocol {}
