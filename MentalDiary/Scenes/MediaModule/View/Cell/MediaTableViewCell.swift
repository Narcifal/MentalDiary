//
//  MediaTableViewCell.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 27.09.2023.
//

import UIKit

final class MediaTableViewCell: UITableViewCell {
    
    // MARK: - Properties -
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var cellView: UIView!
    private let borderWidth: CGFloat = 2
    private let cornerRadius: CGFloat = 25
    lazy var darkerView: UIView = {
        let view = UIView(frame: cellView.bounds)
        let darkenedColor = UIColor(white: 0, alpha: 0.3)
        view.backgroundColor = darkenedColor
        view.alpha = 0
        return view
    }()
    
    // MARK: - Life Cycle -
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupCellView()
        videoImageView.image = UIImage(named: "test")
    }
    
    func cellSelected() {
        let animationDuration = 0.16
        let transformScale = 0.96
        cellView.addSubview(darkerView)
        
        UIView.animate(
            withDuration: animationDuration,
            animations: {
            self.transform = CGAffineTransform(
                scaleX: transformScale,
                y: transformScale
            )
            self.darkerView.alpha = 1.0
        }) { _ in
            UIView.animate(
                withDuration: animationDuration,
                animations: {
                    self.darkerView.alpha = 0
                    self.transform = .identity
                }
            ) { _ in
                self.darkerView.removeFromSuperview()
            }
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MediaTableViewCell", bundle: nil)
    }
    
}

private extension MediaTableViewCell {
    
    func setupCellView() {
        cellView.layer.cornerRadius = cornerRadius
        cellView.layer.cornerCurve = .continuous
        cellView.layer.borderWidth = borderWidth
        cellView.layer.borderColor = UIColor.lightGray.cgColor
    }
}
