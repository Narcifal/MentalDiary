//
//  HomeViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {}

final class HomeViewController: UIViewController {

    static func instantiate(with presenter: HomePresenterProtocol) -> HomeViewController {
        let viewController: HomeViewController = .instantiate(storyboard: .home)
        viewController.presenter = presenter
        return viewController
    }
    
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
        
        setup()
    }
    
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
        articleImageView.image = UIImage(named: "Sunset-Road-iphone")
    }

}

extension HomeViewController: HomeViewProtocol {}
