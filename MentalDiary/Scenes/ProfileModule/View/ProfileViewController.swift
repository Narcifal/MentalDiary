//
//  ProfileViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 28.10.2023.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {}

final class ProfileViewController: UIViewController {
    
    private enum Constant {
        static let numberOfComponents = 1
        static let cornerRadiusTableView: CGFloat = 5
    }
    
    // MARK: - Properties -
    var presenter: ProfilePresenterProtocol!
    private var isStarterScreen = true
    
    // MARK: - UIComponents -
    @IBOutlet private weak var profileEditButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
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
        
        backButton.setTitle("", for: .normal)
        hideNeededView()
        
        setupProfileImageView()
        setupSettingsTableView()
        setupGenderPicker()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        presenter.backButtonTapped()
    }
    
    @IBAction func profileEditButtonTapped(_ sender: UIButton) {
        let pureGreen = UIColor(named: Asset.pureGreen.name)
        profileEditButton.tintColor = (profileEditButton.tintColor == pureGreen) ? .black : pureGreen
        
        hideNeededView()
        presenter.profileEditTapped(sender: sender)
    }
}

extension ProfileViewController: ProfileViewProtocol {}

private extension ProfileViewController {
    
    func setupGenderPicker() {
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
    }
    
    func setupProfileImageView() {
        let cornerRadius = profileImageView.frame.size.width / 2
        
        profileImageView.layer.cornerRadius = cornerRadius
        profileImageView.layer.cornerCurve = .continuous
        profileImageView.clipsToBounds = true
    }
    
    func setupSettingsTableView() {
        settingsTableView.layer.cornerRadius = Constant.cornerRadiusTableView
        settingsTableView.layer.cornerCurve = .continuous
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        
        settingsTableView.register(
            SettingsTableViewCell.nib(),
            forCellReuseIdentifier: SettingsTableViewCell.identifier
        )
    }
    
    func hideNeededView() {
        isStarterScreen.toggle()
        
        profileSettingsView.isHidden = !isStarterScreen
        settingsTableView.isHidden = isStarterScreen
        nameLabel.isHidden = isStarterScreen
        mailLabel.isHidden = isStarterScreen
    }
}

// MARK: - TableView -
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingsTableViewCell.identifier,
            for: indexPath
        ) as! SettingsTableViewCell
        
        cell.configure(presenter.settingsList[indexPath.row])
        
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

// MARK: - PickerView -
extension ProfileViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constant.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.genderList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.genderList[row]
    }
}

extension ProfileViewController: UIPickerViewDelegate {

}
