//
//  ArticleCollectionViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//
import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    private enum Constant {
        static let imageViewHeight: CGFloat = 0.75
        static let articleLabelHeight: CGFloat = 0.25
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 25
        static let verticalInsetConstraint: CGFloat = 10
        static let horizontalInsetConstraint: CGFloat = 20
    }
    
    // MARK: - Properties -
    static let identifier = "ArticleCollectionViewCell"
    
    // MARK: - UIComponents -
    private let placeholderView: UIView = {
        let stackView = UIView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    private let articleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()

    // MARK: - LifeCycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    // MARK: - Iternal -
    func configure(image: UIImage, text: String) {
        articleImageView.image = image
        articleLabel.text = text
    }
}

private extension ArticleCollectionViewCell {
    func setupView() {
        addSubview(placeholderView)
        placeholderView.addSubview(articleImageView)
        placeholderView.addSubview(articleLabel)
        
        let imageHeight = self.bounds.height * Constant.imageViewHeight
        let titleHeight = self.bounds.height * Constant.articleLabelHeight

        NSLayoutConstraint.activate([
            placeholderView.heightAnchor.constraint(equalTo: self.heightAnchor),
            placeholderView.widthAnchor.constraint(equalToConstant: self.bounds.width),
            placeholderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            articleImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            articleImageView.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor),
            articleImageView.topAnchor.constraint(equalTo: placeholderView.topAnchor),
            
            articleLabel.heightAnchor.constraint(equalToConstant: titleHeight),
            articleLabel.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            articleLabel.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor),
            articleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor),
        
        ])

        placeholderView.layer.cornerRadius = Constant.cornerRadius
        placeholderView.layer.cornerCurve = .continuous
        placeholderView.layer.borderWidth = Constant.borderWidth
        placeholderView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
