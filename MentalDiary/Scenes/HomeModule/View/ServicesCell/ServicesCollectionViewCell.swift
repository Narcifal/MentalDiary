//
//  ServicesCollectionViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//
import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    private enum Constant {
        static let imageViewHeight: CGFloat = 0.75
        static let servicesLabelHeight: CGFloat = 0.25
        static let borderWidth: CGFloat = 2
        static let cornerRadius: CGFloat = 25
        static let verticalInsetConstraint: CGFloat = 10
        static let horizontalInsetConstraint: CGFloat = 20
    }
    
    // MARK: - Properties -
    static let identifier = "ServicesCollectionViewCell"
    
    // MARK: - UIComponents -
    private let placeholderView: UIView = {
        let stackView = UIView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        return stackView
    }()
    private let servicesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    private let servicesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .medium)
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
    func configure(with service: RecommendedService) {
        servicesImageView.image = service.image
        servicesLabel.text = service.title
    }
}

private extension ServicesCollectionViewCell {
    func setupView() {
        addSubview(placeholderView)
        placeholderView.addSubview(servicesImageView)
        placeholderView.addSubview(servicesLabel)
        
        let imageHeight = self.bounds.height * Constant.imageViewHeight
        let titleHeight = self.bounds.height * Constant.servicesLabelHeight

        NSLayoutConstraint.activate([
            placeholderView.heightAnchor.constraint(equalTo: self.heightAnchor),
            placeholderView.widthAnchor.constraint(equalToConstant: self.bounds.width),
            placeholderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeholderView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            servicesImageView.heightAnchor.constraint(equalToConstant: imageHeight),
            servicesImageView.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            servicesImageView.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor),
            servicesImageView.topAnchor.constraint(equalTo: placeholderView.topAnchor),
            
            servicesLabel.heightAnchor.constraint(equalToConstant: titleHeight),
            servicesLabel.leadingAnchor.constraint(equalTo: placeholderView.leadingAnchor),
            servicesLabel.trailingAnchor.constraint(equalTo: placeholderView.trailingAnchor),
            servicesLabel.topAnchor.constraint(equalTo: servicesImageView.bottomAnchor),
        
        ])

        placeholderView.layer.cornerRadius = Constant.cornerRadius
        placeholderView.layer.cornerCurve = .continuous
        placeholderView.layer.borderWidth = Constant.borderWidth
        placeholderView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
