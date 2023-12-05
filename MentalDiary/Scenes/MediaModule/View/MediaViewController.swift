//
//  MediaViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import UIKit

protocol MediaViewProtocol: AnyObject {
    func reloadTableView()
}

final class MediaViewController: UIViewController {
    
    private enum Constant {
        static let viewCornerRadius: CGFloat = 15
        static let sizeTitleLabel: CGFloat = 18
        
        static let mediaCellHeight: CGFloat = 140
        static let servicesCellHeight = UITableView.automaticDimension
    }
    
    // MARK: - Properties -
    var presenter: MediaPresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var videoCatalogButton: UIButton!
    @IBOutlet private weak var servicesCatalogButton: UIButton!
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupButtons()
    }
    
    // MARK: - Iternal -
    @IBAction func didTapVideoCatalog(_ sender: UIButton) {
        presenter.videoTabTapped()
        changeActivityButtonColor(with: sender)
    }
    
    @IBAction func didTapservicesCatalog(_ sender: UIButton) {
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
        
        tableView.backgroundColor = .clear
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
}

extension MediaViewController: MediaViewProtocol {}

extension MediaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch presenter.selectedListType {
        case .servicesList:
            return presenter.servicesList.count
        case .mediaList:
            return presenter.mediaList.count
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
            
            cell.configure(image: UIImage(named: "test")!, text: "servicesEE")
            
            return cell
        case .mediaList:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Localized.MediaModule.TableViewCell.identifier,
                for: indexPath
            ) as! MediaTableViewCell
            cell.selectionStyle = .none
            
            cell.configure(title: "Hi", description: "askdfnajsklnfjkasnfnasnfsajknkasfnaskdfnajsklnfjkasnfnasnfsajknkasfn", image: UIImage(named: "test")!)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch presenter.selectedListType {
        case .servicesList:
            return Constant.servicesCellHeight
        case .mediaList:
            return Constant.mediaCellHeight
        }
    }
}

extension MediaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch presenter.selectedListType {
        case .servicesList:
            let cell = tableView.cellForRow(at: indexPath) as! ServicesTableViewCell
            cell.performSelectionAnimation()
        case .mediaList:
            let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell
            cell.performSelectionAnimation()
        }
    }
}
