//
//  ShareViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol ShareViewProtocol: AnyObject {}

final class ShareViewController: UIViewController {
    
    private struct Constants {
        static let situationPlaceholder = "Describe it..."
        static let thoughtsPlaceholder = "What is on you mind..."
        static let feelingsPlaceholder = "What is on you heart..."
        static let defaultPlaceholder = "Share with me..."
    }
    
    static func instantiate(with presenter: SharePresenterProtocol) -> ShareViewController {
        let viewController: ShareViewController = .instantiate(storyboard: .share)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Properties -
    var presenter: SharePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var situationTextView: UITextView!
    @IBOutlet weak var thoughtsTextView: UITextView!
    @IBOutlet weak var feelingsTextView: UITextView!
    @IBOutlet weak var shareButton: UIButton!
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView(view: situationTextView)
        setupTextView(view: thoughtsTextView)
        setupTextView(view: feelingsTextView)
        setupShareButton()
    }
}

private extension ShareViewController {
    
    private func setupTextView(view: UITextView) {
        let cornerRadius: CGFloat = 25
        view.textColor = UIColor.lightGray
        view.layer.cornerRadius = cornerRadius
        view.layer.cornerCurve = .continuous

        let verticalInset: CGFloat = 20
        let horizontalInset: CGFloat = 20
        view.textContainerInset = UIEdgeInsets(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
        view.delegate = self
    }
    
    private func setupShareButton() {
        let cornerRadius: CGFloat = 10
        shareButton.layer.cornerRadius = cornerRadius
        shareButton.layer.cornerCurve = .continuous
    }
    
    @IBAction private func tappedShareButton(_ sender: UIButton) {
        //
    }
}

extension ShareViewController: ShareViewProtocol {}

extension ShareViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            switch textView {
            case situationTextView:
                textView.text = Constants.situationPlaceholder
            case thoughtsTextView:
                textView.text = Constants.thoughtsPlaceholder
            case feelingsTextView:
                textView.text = Constants.feelingsPlaceholder
            default:
                textView.text = Constants.defaultPlaceholder
            }
            
            textView.textColor = UIColor.lightGray
        }
    }
}

