//
//  HomeViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func updateDate(date: String)
}

final class HomeViewController: UIViewController {
    
    // MARK: - Properties -
    var presenter: HomePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var profileDateLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var fillDiaryButton: UIButton!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var diaryAchievementView: UIView!
    @IBOutlet weak var articlePageControl: UIPageControl!
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setup()
    }
    
    // MARK: - Internal -
    func setup() {
        view.backgroundColor = .white
        
        articleView.layer.cornerRadius = 15
        articleView.layer.cornerCurve = .continuous
        fillDiaryButton.layer.cornerRadius = 10
        fillDiaryButton.layer.cornerCurve = .continuous
        profileButton.layer.cornerRadius = 30
        profileButton.layer.cornerCurve = .continuous
        diaryAchievementView.layer.cornerRadius = 15
        diaryAchievementView.layer.cornerCurve = .continuous
        
        articleImageView.contentMode = .scaleToFill
        articleImageView.image = Asset.test.image
    }

    
}

// MARK: - HomeViewProtocol -
extension HomeViewController: HomeViewProtocol {
    func updateDate(date: String) {
        profileDateLabel.text = date
    }
}

// MARK: - Private -
private extension HomeViewController {
    @IBAction func fillDairyTapped(_ sender: Any) {
        presenter.routeToReport()
    }
}
