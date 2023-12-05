//
//  StatisticsViewController.swift
//  MentalDiary
//
//  Created by Denys Niestierov on 11.11.2023.
//

import UIKit

protocol StatisticsViewProtocol: AnyObject { 
    func setNotes(_ notes: [NoteModel])
}

final class StatisticsViewController: UIViewController, StatisticsViewProtocol {

    @IBOutlet private weak var notesTableView: UITableView! {
        didSet {
            notesTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
            notesTableView.delegate = self
            notesTableView.dataSource = self
        }
    }
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "No notes available"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.isHidden = true
        return label
    }()
    
    // MARK: - Properties -
    var presenter: StatisticsPresenterProtocol!
    private var notes: [NoteModel] = []
    
    // MARK: - LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    func setNotes(_ notes: [NoteModel]) {
        self.notes = notes
        notesTableView.reloadData()
    }
}

extension StatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if notes.isEmpty {
            emptyLabel.isHidden = false
            notesTableView.backgroundView = emptyLabel
            notesTableView.separatorStyle = .none
        } else {
            emptyLabel.isHidden = true
            notesTableView.backgroundView = nil
            notesTableView.separatorStyle = .singleLine
        }
        
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as! NoteTableViewCell
        let note = notes[indexPath.row]
        cell.render(with: note)
        return cell
    }
}

extension StatisticsViewController: UITableViewDelegate {
    
}
