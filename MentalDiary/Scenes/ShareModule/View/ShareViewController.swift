//
//  ShareViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol ShareViewProtocol: AnyObject { }

final class ShareViewController: UIViewController {
    
    private enum Constant {
        static let progress: Float = 1
        static let backButtonImage = "arrow.backward"
        static let cornerRadiusTextView: CGFloat = 25
        static let cornerRadiusButton: CGFloat = 25
        static let verticalInsetTextView: CGFloat = 25
        static let horizontalInsetTextView: CGFloat = 10
        
        enum Placeholder {
            static let titleSituation = "Describe it..."
            static let titleThoughts = "What is on you mind..."
            static let titleFeelings = "What is on you heart..."
            static let titleDefault = "Share with me..."
        }
    }
    
    // MARK: - Properties -
    var presenter: SharePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet private weak var situationTextView: UITextView!
    @IBOutlet private weak var thoughtsTextView: UITextView!
    @IBOutlet private weak var feelingsTextView: UITextView!
    @IBOutlet private weak var shareButton: UIButton!
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = Constant.progress
        
        setupTextView(view: situationTextView)
        setupTextView(view: thoughtsTextView)
        setupTextView(view: feelingsTextView)
        setupShareButton()
    }
}

private extension ShareViewController {
    
    private func setupTextView(view: UITextView) {
        view.textColor = UIColor.lightGray
        view.layer.cornerRadius = Constant.cornerRadiusTextView
        view.layer.cornerCurve = .continuous

        let verticalInset: CGFloat = Constant.verticalInsetTextView
        let horizontalInset: CGFloat = Constant.horizontalInsetTextView
        
        view.textContainerInset = UIEdgeInsets(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
        view.delegate = self
    }
    
    private func setupShareButton() {
        shareButton.layer.cornerRadius = Constant.cornerRadiusButton
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
                textView.text = Constant.Placeholder.titleSituation
            case thoughtsTextView:
                textView.text = Constant.Placeholder.titleThoughts
            case feelingsTextView:
                textView.text = Constant.Placeholder.titleFeelings
            default:
                textView.text = Constant.Placeholder.titleDefault
            }
            
            textView.textColor = UIColor.lightGray
        }
    }
}

