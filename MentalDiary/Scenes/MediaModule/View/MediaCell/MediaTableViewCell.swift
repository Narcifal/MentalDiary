//
//  MediaTableViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import UIKit

final class MediaTableViewCell: UITableViewCell {
    
    private enum Constant {
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 25
        static let verticalInsetConstraint: CGFloat = 10
        static let horizontalInsetConstraint: CGFloat = 20
    }
    
    // MARK: - UIComponents -
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    private let mediaImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    private let rightView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func configure(title: String, description: String, image: UIImage) {
        titleLabel.text = title
        descriptionLabel.text = description
        mediaImageView.image = image
    }
}

private extension MediaTableViewCell {
    
    func setupViews() {
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(mediaImageView)
        mainStackView.addArrangedSubview(rightView)
        
        rightView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
                constant: Constant.horizontalInsetConstraint
            ),
            mainStackView.trailingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,
                constant: -Constant.horizontalInsetConstraint
            ),
            mainStackView.topAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                constant: Constant.verticalInsetConstraint
            ),
            mainStackView.bottomAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constant.verticalInsetConstraint
            ),
            
            verticalStackView.leadingAnchor.constraint(
                equalTo: rightView.leadingAnchor,
                constant: Constant.horizontalInsetConstraint
            ),
            verticalStackView.trailingAnchor.constraint(
                equalTo: rightView.trailingAnchor,
                constant: -Constant.horizontalInsetConstraint
            ),
            verticalStackView.topAnchor.constraint(
                equalTo: rightView.topAnchor,
                constant: Constant.verticalInsetConstraint
            ),
            verticalStackView.bottomAnchor.constraint(
                equalTo: rightView.bottomAnchor,
                constant: -Constant.verticalInsetConstraint
            )
        ])

        mainStackView.layer.cornerRadius = Constant.cornerRadius
        mainStackView.layer.cornerCurve = .continuous
        mainStackView.layer.borderWidth = Constant.borderWidth
        mainStackView.layer.borderColor = UIColor.lightGray.cgColor
    }
}


