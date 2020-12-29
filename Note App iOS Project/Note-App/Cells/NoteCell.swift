//
//  NoteCell.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 27/12/2020.
//

import UIKit

class NoteCell: UITableViewCell {
    
    let stackView = UIStackView(frame: .zero)
    var titleLabel = UILabel(frame: .zero)
    var noteLabel = UILabel(frame: .zero)
    var dateLabel = UILabel(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        configureStackView()
        configureLabels()
    }
    
    private func configureStackView() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    private func configureLabels() {
        configureTitleLabel()
        configureNoteLabel()
        configureDateLabel()
        
        let labels = [titleLabel, noteLabel, dateLabel]
        for label in labels {
            stackView.addArrangedSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.adjustsFontForContentSizeCategory = true
            label.textAlignment = .center
        }
    }
    
    private func configureTitleLabel() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.textColor = .label
    }
    
    private func configureNoteLabel() {
        noteLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        noteLabel.textColor = .secondaryLabel
    }
    
    private func configureDateLabel() {
        dateLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        dateLabel.textColor = .tertiaryLabel
    }
    
    
    
}
