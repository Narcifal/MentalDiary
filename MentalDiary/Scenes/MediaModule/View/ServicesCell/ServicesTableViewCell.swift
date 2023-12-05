//
//  ServicesTableViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import UIKit

class ServicesTableViewCell: UITableViewCell {
    private enum Constant {
        static let servicesImageViewHeight: CGFloat = 110
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 25
        static let verticalInsetConstraint: CGFloat = 10
        static let horizontalInsetConstraint: CGFloat = 20
    }
    
    static let identifier = "ServicesTableViewCell"
    
    // MARK: - UIComponents -
    private lazy var servicesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    private lazy var servicesTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    // MARK: - Life Cycle -
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .white
    }

    // MARK: - Internal -
    
    func configure(with service: Service) {
        servicesImageView.image = service.image
        servicesTitleLabel.text = service.title
    }
}

private extension ServicesTableViewCell {
    func setupViews() {
        contentView.addSubview(servicesImageView)
        contentView.addSubview(servicesTitleLabel)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constant.horizontalInsetConstraint),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constant.horizontalInsetConstraint),
            contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constant.verticalInsetConstraint),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constant.verticalInsetConstraint),
            
            servicesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            servicesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            servicesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            servicesImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            servicesImageView.heightAnchor.constraint(equalToConstant: Constant.servicesImageViewHeight),
            
            servicesTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            servicesTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            servicesTitleLabel.topAnchor.constraint(equalTo: servicesImageView.bottomAnchor),
            servicesTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            servicesTitleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.35)
        ])
        
        contentView.layer.cornerRadius = Constant.cornerRadius
        contentView.layer.cornerCurve = .continuous
        contentView.layer.borderWidth = Constant.borderWidth
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.clipsToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
