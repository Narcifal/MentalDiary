//
//  ProfileViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {}

final class ProfileViewController: UIViewController {
    
    static func instantiate(with presenter: ProfilePresenterProtocol) -> ProfileViewController {
        let viewController: ProfileViewController = .instantiate(storyboard: .profile)
        viewController.presenter = presenter
        return viewController
    }
    
    // MARK: - Properties -
    private var presenter: ProfilePresenterProtocol!
    private var isStarterScreen = false
    private let genderList = ["M", "W"]
    private let settingsList = ["Contact Support", "Terms & Condition", "Log out"]
    
    // MARK: - UIComponents -
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var genderPickerView: UIPickerView!
    @IBOutlet private weak var settingsTableView: UITableView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var mailLabel: UILabel!
    @IBOutlet private weak var profileSettingsView: UIView!
    @IBOutlet private weak var profileImageView: UIImageView!
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNeededView()
        setupProfileImageView()
        setupSettingsTableView()
        setupGenderPicker()
    }
}

private extension ProfileViewController {
    
    private func setupGenderPicker() {
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
    }
    
    private func setupProfileImageView() {
        let cornerRadius = profileImageView.frame.size.width/2
        profileImageView.layer.cornerRadius = cornerRadius
        profileImageView.layer.cornerCurve = .continuous
        profileImageView.clipsToBounds = true
        
        profileImageView.image = UIImage(named: "angry")
    }
    
    private func setupSettingsTableView() {
        let cornerRadius: CGFloat = 5
        settingsTableView.layer.cornerRadius = cornerRadius
        settingsTableView.layer.cornerCurve = .continuous
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.register(SettingsTableViewCell.nib(), forCellReuseIdentifier: SettingsTableViewCell.identifier)
    }
    
    private func hideNeededView() {
        if isStarterScreen {
            profileSettingsView.isHidden = true
        } else {
            profileSettingsView.isHidden = false
            nameLabel.isHidden = true
            mailLabel.isHidden = true
            settingsTableView.isHidden = true
        }
    }
}

extension ProfileViewController: ProfileViewProtocol {}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as! SettingsTableViewCell
        cell.configure(settingsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderList[row]
    }
}

extension ProfileViewController: UIPickerViewDelegate {

}
