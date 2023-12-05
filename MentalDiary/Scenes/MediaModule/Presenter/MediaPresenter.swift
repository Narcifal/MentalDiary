//
//  MediaPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import Foundation
import YouTubePlayer

protocol MediaPresenterProtocol: AnyObject {
    var selectedListType: MediaType { get }
    func getServicesListCount() -> Int
    func getMediaListCount() -> Int
    func getServicesListItem(at index: Int) -> Service
    func getMediaListItem(at index: Int) -> Video
    func servicesTabTapped()
    func videoTabTapped()
    func loadYouTubeVideo(for view: YouTubePlayerView, with url: String)
}

final class MediaPresenter: MediaPresenterProtocol {
    
    //MARK: - Properties -
    
    private weak var view: MediaViewProtocol?
    private let router: RouterProtocol
    private(set) var selectedListType: MediaType = .mediaList
    private let servicesList: [Service] = MockFactory.services
    private let mediaList: [Video] = MockFactory.videos
    
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
    
    func getServicesListCount() -> Int {
        servicesList.count
    }
    
    func getServicesListItem(at index: Int) -> Service {
        servicesList[index]
    }
    
    func getMediaListCount() -> Int {
        mediaList.count
    }
    
    func getMediaListItem(at index: Int) -> Video {
        mediaList[index]
    }
    
    func loadYouTubeVideo(for view: YouTubePlayerView, with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        view.loadVideoURL(url)
    }
}

enum MediaType {
    case mediaList
    case servicesList
}
