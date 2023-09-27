//
//  UIStoryboardExtension.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 16.09.2023.
//

import UIKit

enum Storyboards: String {
    case home = "Home"
    case media = "Media"
}

extension UIViewController {
    
    class func instantiate<T: UIViewController>(storyboard: Storyboards) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("Cannot create \(T.self)")
        }
        return vc
    }
}
