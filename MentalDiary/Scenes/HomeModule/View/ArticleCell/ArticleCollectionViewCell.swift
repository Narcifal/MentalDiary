//
//  ArticleCollectionViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import Foundation

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
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
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
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(articleImageView)
        stackView.addArrangedSubview(articleLabel)
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: contentView.bounds.width),
            stackView.heightAnchor.constraint(equalToConstant: contentView.bounds.height),
            
            articleImageView.heightAnchor.constraint(
                equalTo: stackView.heightAnchor,
                multiplier: Constant.imageViewHeight
            ),
            articleLabel.heightAnchor.constraint(
                equalTo: stackView.heightAnchor,
                multiplier: Constant.articleLabelHeight
            )
        ])
        
        stackView.layer.cornerRadius = Constant.cornerRadius
        stackView.layer.cornerCurve = .continuous
        stackView.layer.borderWidth = Constant.borderWidth
        stackView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
