//
//  NoteTableViewCell.swift
//  MentalDiary
//
//  Created by Danil Frolov on 05.12.2023.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {
    
    static let identifier = "NoteTableViewCell"
    
    // MARK: - UI Elements
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let moodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mood:"
        return label
    }()
    
    private let moodTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let situationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Situation:"
        return label
    }()
    
    private let situationTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let thoughtsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thoughts:"
        return label
    }()
    
    private let thoughtsTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let feelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Feel:"
        return label
    }()
    
    private let feelTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(with note: NoteModel) {
        dateLabel.text = note.date.formatted()
        moodTextLabel.text = Emotion.state(index: note.mentalHealthRate).getState.title
        situationTextLabel.text = note.situation
        thoughtsTextLabel.text = note.thoughts
        feelTextLabel.text = note.feel
    }
}

private extension NoteTableViewCell {
    
    func setupUI() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(moodLabel)
        contentView.addSubview(moodTextLabel)
        contentView.addSubview(situationLabel)
        contentView.addSubview(situationTextLabel)
        contentView.addSubview(thoughtsLabel)
        contentView.addSubview(thoughtsTextLabel)
        contentView.addSubview(feelLabel)
        contentView.addSubview(feelTextLabel)
        
        let constraints = [
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            moodLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            moodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            moodTextLabel.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 4),
            moodTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            moodTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            situationLabel.topAnchor.constraint(equalTo: moodTextLabel.bottomAnchor, constant: 8),
            situationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            situationTextLabel.topAnchor.constraint(equalTo: situationLabel.bottomAnchor, constant: 4),
            situationTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            situationTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            thoughtsLabel.topAnchor.constraint(equalTo: situationTextLabel.bottomAnchor, constant: 8),
            thoughtsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            thoughtsTextLabel.topAnchor.constraint(equalTo: thoughtsLabel.bottomAnchor, constant: 4),
            thoughtsTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            thoughtsTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            feelLabel.topAnchor.constraint(equalTo: thoughtsTextLabel.bottomAnchor, constant: 8),
            feelLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            
            feelTextLabel.topAnchor.constraint(equalTo: feelLabel.bottomAnchor, constant: 4),
            feelTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            feelTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            feelTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
