//
//  MediaPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import Foundation

protocol MediaPresenterProtocol: AnyObject {
    var selectedListType: MediaType { get }
    var articlesList: [ArticleTableViewCell] { get }
    var mediaList: [MediaTableViewCell] { get }
    func articlesTabTapped()
    func videoTabTapped()
}

final class MediaPresenter: MediaPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: MediaViewProtocol?
    private let router: RouterProtocol
    private(set) var selectedListType: MediaType = .mediaList
    private(set) var articlesList: [ArticleTableViewCell] = [
        ArticleTableViewCell(),
        ArticleTableViewCell(),
        ArticleTableViewCell(),
        ArticleTableViewCell(),
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
    
    func articlesTabTapped() {
        selectedListType = .articlesList
        view?.reloadTableView()
    }
}

enum MediaType {
    case mediaList
    case articlesList
}
