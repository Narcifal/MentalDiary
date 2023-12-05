//
//  ServicesPageViewControler.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 05.12.2023.
//

import UIKit
import WebKit

protocol ServicesPageView: AnyObject {
    func loadWebPage(with: URLRequest)
}

final class ServicesPageViewControler: UIViewController {
    private enum Constant {
        static let backNavigationButtonImage = "chevron.left"
        static let backNavigationButtonTitle = "Back"
    }
    
    // MARK: - Properties -
    
    private var presenter: ServicesPagePresenterProtocol!
    private lazy var backNavigationButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(backNavigationButtonTapped), for: .touchUpInside)
        let image = UIImage(systemName: Constant.backNavigationButtonImage)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(named: Asset.pureGreen.name)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var webView: WKWebView = {
        let view = WKWebView(frame: view.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
        presenter.startRequest()
    }
    
    init(presenter: ServicesPagePresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        backNavigationButton.layer.cornerRadius = backNavigationButton.frame.width / 2
    }
    
    // MARK: - Private -
    
    @objc private func backNavigationButtonTapped() {
        presenter.backToHomeScreen()
    }
    
    private func setupView() {
        view.addSubview(webView)
        view.addSubview(backNavigationButton)
        
        NSLayoutConstraint.activate([
            backNavigationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backNavigationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backNavigationButton.heightAnchor.constraint(equalToConstant: 50),
            backNavigationButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ServicesPageViewControler: ServicesPageView {
    func loadWebPage(with request: URLRequest) {
        DispatchQueue.main.async {
            self.webView.load(request)
        }
    }
}
