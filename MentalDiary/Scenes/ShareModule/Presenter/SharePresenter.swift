//
//  SharePresenter.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit
import SwiftData

protocol SharePresenterProtocol: AnyObject {
    func backButtonTapped()
    func onShareAction(with situation: String, _ thoughts: String, _ feel: String)
}

final class SharePresenter: SharePresenterProtocol {
    
    //MARK: - Properties -
    private weak var view: ShareViewProtocol?
    private let router: RouterProtocol
    private let navigationController: UINavigationController
    
    private let notesDatabase: NotesDatabase
    private let mentalHealthRate: Int
        
    // MARK: - Life Cycle -
    required init(
        router: RouterProtocol,
        navigationController: UINavigationController,
        notesDatabase: NotesDatabase,
        mentalHealthRate: Int
    ) {
        self.router = router
        self.navigationController = navigationController
        self.notesDatabase = notesDatabase
        self.mentalHealthRate = mentalHealthRate
    }
    
    // MARK: - Iternal -
    func inject(view: ShareViewProtocol) {
        self.view = view
    }
  
    func backButtonTapped() {
        router.back(navigationController: navigationController, animated: false)
    }
    
    @MainActor 
    func onShareAction(
        with situation: String,
        _ thoughts: String,
        _ feel: String
    ) {
        let diaryNote = NoteModel(
            mentalHealthRate: mentalHealthRate,
            situation: situation,
            thoughts: thoughts,
            feel: feel,
            date: Date()
        )
        notesDatabase.saveNote(note: diaryNote)
        
        NotificationCenter.default.post(name: .noteWasSaved, object: nil)
        
        router.backToTabBarTapped()
    }
}
