//
//  MediaPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import Foundation

protocol MediaPresenterProtocol: AnyObject {
    var selectedType: mediaType
}

final class MediaPresenter: MediaPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: MediaViewProtocol?
    private let router: RouterProtocol
    
    var articles
    var videos
    
    var selectedType: mediaType = .media
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol) {
        self.router = router
    }
    
    // MARK: - Iternal -
    func inject(view: MediaViewProtocol) {
        self.view = view
    }
    
}


enum mediaType {
    case media
    case articles
}
