//
//  MediaViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import UIKit
import YouTubePlayer

protocol MediaViewProtocol: AnyObject {
    func reloadTableView()
}

final class MediaViewController: UIViewController {
    
    private enum Constant {
        static let viewCornerRadius: CGFloat = 15
        static let sizeTitleLabel: CGFloat = 18
    }
    
    // MARK: - Properties -
    var presenter: MediaPresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var videoCatalogButton: UIButton!
    @IBOutlet private weak var servicesCatalogButton: UIButton!
    
    private lazy var mediaViewOverlay: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissOverlay))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    private lazy var youtubePlayerView: YouTubePlayerView = {
        let playerFrame = CGRect(
            x: .zero,
            y: .zero,
            width: view.frame.width,
            height: view.frame.height * 0.33
        )
        let view = YouTubePlayerView(frame: playerFrame)
        view.center = mediaViewOverlay.center
        return view
    }()

    // MARK: - Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
        setupButtons()
    }
    
    // MARK: - Internal -
    
    @IBAction func didTapVideoCatalog(_ sender: UIButton) {
        presenter.videoTabTapped()
        changeActivityButtonColor(with: sender)
    }
    
    @IBAction func didTapServicesCatalog(_ sender: UIButton) {
        presenter.servicesTabTapped()
        changeActivityButtonColor(with: sender)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

private extension MediaViewController {
    func setupButtons() {
        videoCatalogButton.layer.cornerRadius = Constant.viewCornerRadius
        videoCatalogButton.layer.cornerCurve = .continuous
        videoCatalogButton.titleLabel?.font = .boldSystemFont(ofSize: Constant.sizeTitleLabel)
        
        servicesCatalogButton.layer.cornerRadius = Constant.viewCornerRadius
        servicesCatalogButton.layer.cornerCurve = .continuous
        servicesCatalogButton.titleLabel?.font = .boldSystemFont(ofSize: Constant.sizeTitleLabel)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            MediaTableViewCell.self,
            forCellReuseIdentifier: Localized.MediaModule.TableViewCell.identifier
        )
        tableView.register(
            ServicesTableViewCell.self,
            forCellReuseIdentifier: ServicesTableViewCell.identifier
        )
        
        tableView.backgroundColor = .white
        tableView.indicatorStyle = .black
    }
    
    func changeActivityButtonColor(with button: UIButton) {
        button.backgroundColor = UIColor(named: Asset.pureGreen.name)
        switch button {
        case videoCatalogButton:
            servicesCatalogButton.backgroundColor = .lightGray
        case servicesCatalogButton:
            videoCatalogButton.backgroundColor = .lightGray
        default: break
        }
    }
    
    func showVideoOverlay(with urlString: String) {
        mediaViewOverlay.addSubview(youtubePlayerView)
        view.addSubview(mediaViewOverlay)

        presenter.loadYouTubeVideo(for: youtubePlayerView, with: urlString)
    }

    @objc func dismissOverlay() {
        view.subviews.last?.removeFromSuperview()
    }
}

extension MediaViewController: MediaViewProtocol {}

extension MediaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.selectedListType {
        case .servicesList:
            return presenter.getServicesListCount()
        case .mediaList:
            return presenter.getMediaListCount()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch presenter.selectedListType {
        case .servicesList:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ServicesTableViewCell.identifier,
                for: indexPath
            ) as! ServicesTableViewCell
            cell.selectionStyle = .none
            
            let service = presenter.getServicesListItem(at: indexPath.row)
            
            cell.configure(with: service)
            
            return cell
        case .mediaList:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Localized.MediaModule.TableViewCell.identifier,
                for: indexPath
            ) as! MediaTableViewCell
            cell.selectionStyle = .none
            
            let video = presenter.getMediaListItem(at: indexPath.row)
            
            cell.configure(with: video)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension MediaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch presenter.selectedListType {
        case .servicesList:
            let cell = tableView.cellForRow(at: indexPath) as! ServicesTableViewCell
            cell.performSelectionAnimation()
            
            let serviceUrlString = self.presenter.getServicesListItem(at: indexPath.item).link
            presenter.routeToServicesPage(webViewUrl: serviceUrlString)
        case .mediaList:
            let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell
            cell.performSelectionAnimation()
            
            let videoUrlString = self.presenter.getMediaListItem(at: indexPath.item).link
            showVideoOverlay(with: videoUrlString)
        }
    }
}
