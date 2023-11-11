//
//  UITableViewCell+Extension.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import UIKit


extension UITableViewCell {
    func performSelectionAnimation() {
        guard let stackView = self.contentView.subviews.compactMap({ $0 as? UIStackView }).first else { return }
        let darkerView: UIView = {
            let view = UIView(frame: stackView.bounds)
            let darkenedColor = UIColor(white: 0, alpha: 0.3)
            view.backgroundColor = darkenedColor
            view.alpha = 0
            return view
        }()
        
        stackView.addSubview(darkerView)
        
        let animationDuration = 0.16
        let transformScale: CGFloat = 0.96
        
        UIView.animate(withDuration: animationDuration, animations: {
            stackView.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)
            darkerView.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: animationDuration, animations: {
                darkerView.alpha = 0
                stackView.transform = .identity
            }) { _ in
                darkerView.removeFromSuperview()
            }
        }
    }
}
