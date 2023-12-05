//
//  StatisticsPresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import Foundation

protocol StatisticsPresenterProtocol: AnyObject {
    func viewDidLoad()
}

final class StatisticsPresenter: StatisticsPresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: StatisticsViewProtocol?
    private let router: RouterProtocol
    
    private let notesDatabase: NotesDatabase!
    
    // MARK: - Life Cycle -
    required init(router: RouterProtocol, notesDatabase: NotesDatabase) {
        self.router = router
        self.notesDatabase = notesDatabase
    }
    
    // MARK: - Iternal -
    func inject(view: StatisticsViewProtocol) {
        self.view = view
    }
    
    @MainActor 
    func viewDidLoad() {
        addObservers()
        fetchNotes()
    }
}

private extension StatisticsPresenter {
    func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(fetchNotes),
            name: .noteWasSaved,
            object: nil
        )
    }
    
    @MainActor
    @objc func fetchNotes() {
        notesDatabase.fetchNotes() { [weak self] notes, error in
            if let notes {
                self?.view?.setNotes(notes)
            }
        }
    }
}
