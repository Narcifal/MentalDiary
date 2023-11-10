//
//  MediaViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import UIKit

protocol MediaViewProtocol: AnyObject {}

final class MediaViewController: UIViewController {
    
    // MARK: - Properties -
    var presenter: MediaPresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var videoCatalogButton: UIButton!
    @IBOutlet weak var articleCatalogButton: UIButton!
    private let cellHeight: CGFloat = 140
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupButtons()
    }
    
    // MARK: - Iternal -
    @IBAction func didTapVideoCatalog(_ sender: UIButton) {
        changeActivityButtonColor(with: sender)
    }
    
    @IBAction func didTapArticleCatalog(_ sender: UIButton) {
        changeActivityButtonColor(with: sender)
    }
}

private extension MediaViewController {
    
    func setupButtons() {
        let radius: CGFloat = 15
        videoCatalogButton.layer.cornerRadius = radius
        videoCatalogButton.layer.cornerCurve = .continuous
        videoCatalogButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        articleCatalogButton.layer.cornerRadius = radius
        articleCatalogButton.layer.cornerCurve = .continuous
        articleCatalogButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MediaTableViewCell.nib(), forCellReuseIdentifier: Localized.MediaModule.TableViewCell.identifier)
        tableView.backgroundColor = .clear

    }
    
    func changeActivityButtonColor(with button: UIButton) {
        button.backgroundColor = UIColor(named: "PureGreen")
        switch button {
        case videoCatalogButton:
            articleCatalogButton.backgroundColor = .lightGray
        case articleCatalogButton:
            videoCatalogButton.backgroundColor = .lightGray
        default: break
        }
    }
}

extension MediaViewController: MediaViewProtocol {}

extension MediaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: Localized.MediaModule.TableViewCell.identifier) as! MediaTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

extension MediaViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell
        cell.cellSelected()
    }
}
