//
//  UITableViewCell+Extension.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import UIKit


extension UITableViewCell {
    func performSelectionAnimation() {
        let darkerView: UIView = {
            let view = UIView(frame: self.contentView.bounds)
            let darkenedColor = UIColor(white: 0, alpha: 0.3)
            view.backgroundColor = darkenedColor
            view.alpha = 0
            return view
        }()
        
        self.contentView.addSubview(darkerView)
        
        let animationDuration = 0.16
        let transformScale: CGFloat = 0.96
        
        UIView.animate(withDuration: animationDuration, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: transformScale, y: transformScale)
            darkerView.alpha = 1.0
        }) { _ in
            UIView.animate(withDuration: animationDuration, animations: {
                darkerView.alpha = 0
                self.contentView.transform = .identity
            }) { _ in
                darkerView.removeFromSuperview()
            }
        }
    }
}
