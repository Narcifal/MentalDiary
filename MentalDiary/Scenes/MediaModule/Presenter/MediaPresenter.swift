//
//  MediaPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import Foundation

protocol MediaPresenterProtocol: AnyObject {
    var selectedListType: MediaType { get }
    var servicesList: [ServicesTableViewCell] { get }
    var mediaList: [MediaTableViewCell] { get }
    func servicesTabTapped()
    func videoTabTapped()
}

final class MediaPresenter: MediaPresenterProtocol {
    
    //MARK: - Properties -
    
    private weak var view: MediaViewProtocol?
    private let router: RouterProtocol
    private(set) var selectedListType: MediaType = .mediaList
    private(set) var servicesList: [ServicesTableViewCell] = [
        ServicesTableViewCell(),
        ServicesTableViewCell(),
        ServicesTableViewCell(),
        ServicesTableViewCell(),
    ]
    private(set) var mediaList: [MediaTableViewCell] = [
        MediaTableViewCell(),
        MediaTableViewCell(),
        MediaTableViewCell(),
        MediaTableViewCell(),
        MediaTableViewCell(),
        MediaTableViewCell(),
    ]
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: MediaViewProtocol) {
        self.view = view
    }
    
    func videoTabTapped() {
        selectedListType = .mediaList
        view?.reloadTableView()
    }
    
    func servicesTabTapped() {
        selectedListType = .servicesList
        view?.reloadTableView()
    }
}

enum MediaType {
    case mediaList
    case servicesList
}
