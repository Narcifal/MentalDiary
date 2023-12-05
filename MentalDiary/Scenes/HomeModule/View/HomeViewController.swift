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
        static let cornerRadiusServicesView: CGFloat = 15
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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            ServicesCollectionViewCell.self,
            forCellWithReuseIdentifier: ServicesCollectionViewCell.identifier
        )
        collectionView.layer.cornerRadius = Constant.cornerRadiusServicesView
        collectionView.layer.cornerCurve = .continuous
    }
    
    func setupPageControl() {
        pageControl.numberOfPages = presenter.getServicesListCount()
        pageControl.currentPage = Constant.defaultPageControl
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getServicesListCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ServicesCollectionViewCell.identifier,
            for: indexPath
        ) as! ServicesCollectionViewCell
        
        let service = presenter.getServicesListItem(at: indexPath.item)
        
        cell.configure(image: service.image, text: service.title)
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(currentPage)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width - 20
        return CGSize(width: width, height: collectionView.bounds.height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 20
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        let inset: CGFloat = 20 / 2
        return UIEdgeInsets(
            top: 0,
            left: inset,
            bottom: 0,
            right: inset
        )
    }
}
