//
//  HomeViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject { }

final class HomeViewController: UIViewController {
    
    private enum Constant {
        static let defaultPageControl = 0
        static let cornerRadiusArticleView: CGFloat = 15
        static let cornerRadiusFillDiaryButton: CGFloat = 10
        static let cornerRadiusDiaryAchievementView: CGFloat = 15
    }
    
    // MARK: - Properties -
    var presenter: HomePresenterProtocol!
    
    // MARK: - UIComponents -
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet private weak var profileDateLabel: UILabel!
    @IBOutlet private weak var profileNameLabel: UILabel!
    @IBOutlet private weak var profileButton: UIButton!
    @IBOutlet private weak var fillDiaryButton: UIButton!
    @IBOutlet private weak var diaryAchievementView: UIView!
    @IBOutlet private weak var pageControl: UIPageControl!

    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
        setupPageControl()
    }
    
    // MARK: - Iternal -
    @IBAction func fillDairyTapped(_ sender: Any) {
        presenter.routeToRateScreen()
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        presenter.routeToProfileScreen()
    }
}

extension HomeViewController: HomeViewProtocol { }

private extension HomeViewController {
    
    func setupView() {
        view.backgroundColor = .white
        
        fillDiaryButton.layer.cornerRadius = Constant.cornerRadiusFillDiaryButton
        fillDiaryButton.layer.cornerCurve = .continuous
        
        let cornerRadiusProfileButton = profileButton.frame.size.width/2
        profileButton.layer.cornerRadius = cornerRadiusProfileButton
        profileButton.layer.cornerCurve = .continuous
        
        diaryAchievementView.layer.cornerRadius = Constant.cornerRadiusDiaryAchievementView
        diaryAchievementView.layer.cornerCurve = .continuous
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        collectionView.register(
            ArticleCollectionViewCell.self,
            forCellWithReuseIdentifier: ArticleCollectionViewCell.identifier
        )

        collectionView.layer.cornerRadius = Constant.cornerRadiusArticleView
        collectionView.layer.cornerCurve = .continuous
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = presenter.articlesList.count
        pageControl.currentPage = Constant.defaultPageControl
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.articlesList.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArticleCollectionViewCell.identifier,
            for: indexPath
        ) as! ArticleCollectionViewCell
        
        cell.configure(image: UIImage(named: "test")!, text: "This is my test")
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(currentPage)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width-10
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
}
