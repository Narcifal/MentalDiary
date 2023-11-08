//
//  SettingsTableViewCell.swift
//  EmptyMentalDiary
//
//  Created by Denys Niestierov on 01.11.2023.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    static let identifier = "SettingsCell"
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    func configure(_ settingsText: String) {
        settingsLabel.text = settingsText
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SettingsTableViewCell", bundle: nil)
    }
    
}
