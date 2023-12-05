//
//  ArticleTableViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import UIKit

import UIKit

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    private enum Constant {
        static let articleImageViewHeight: CGFloat = 110
        static let articleTitleLabelHeight: CGFloat = 40
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 25
        static let verticalInsetConstraint: CGFloat = 10
        static let horizontalInsetConstraint: CGFloat = 20
    }
    
    static let identifier = "ArticleTableViewCell"
    
    // MARK: - UIComponents -
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.clipsToBounds = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        return stack
    }()
    private lazy var articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.heightAnchor.constraint(equalToConstant: Constant.articleImageViewHeight)
            .isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var articleTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.heightAnchor.constraint(equalToConstant: Constant.articleTitleLabelHeight)
            .isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - LifeCycle -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    // MARK: - Iternal -
    func configure(image: UIImage, text: String) {
        articleImageView.image = image
        articleTitleLabel.text = text
    }
}

private extension ArticleTableViewCell {
    
    func setupViews() {
        stackView.addArrangedSubview(articleImageView)
        stackView.addArrangedSubview(articleTitleLabel)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: Constant.horizontalInsetConstraint),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -Constant.horizontalInsetConstraint),
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: Constant.verticalInsetConstraint),
            stackView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.verticalInsetConstraint)
        ])
        
        stackView.layer.cornerRadius = Constant.cornerRadius
        stackView.layer.cornerCurve = .continuous
        stackView.layer.borderWidth = Constant.borderWidth
        stackView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
