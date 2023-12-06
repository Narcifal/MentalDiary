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
    private let mediaImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 0
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
        label.textColor = .black
        return label
    }()

    // MARK: - Life Cycle -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .white
    }
    
    // MARK: - Internal -
    
    func configure(with video: Video) {
        titleLabel.text = video.title
        descriptionLabel.text = video.description
        mediaImageView.image = video.image
    }
}

private extension MediaTableViewCell {
    func setupViews() {
        contentView.addSubview(mediaImageView)
        contentView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 140),
            
            contentView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: Constant.horizontalInsetConstraint
            ),
            contentView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -Constant.horizontalInsetConstraint
            ),
            contentView.topAnchor.constraint(
                equalTo: self.topAnchor,
                constant: Constant.verticalInsetConstraint
            ),
            contentView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: -Constant.verticalInsetConstraint
            ),
            
            mediaImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mediaImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mediaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mediaImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            
            verticalStackView.leadingAnchor.constraint(equalTo: mediaImageView.trailingAnchor, constant: 10),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.horizontalInsetConstraint),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.verticalInsetConstraint),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constant.verticalInsetConstraint),
        ])

        contentView.layer.cornerRadius = Constant.cornerRadius
        contentView.layer.cornerCurve = .continuous
        contentView.layer.borderWidth = Constant.borderWidth
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
    }
}


