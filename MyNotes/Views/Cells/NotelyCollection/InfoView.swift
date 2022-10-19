//
//  InfoView.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 29.09.2022.
//

import UIKit

class InfoView: UIView {
    //MARK: NameLabel
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont(name: "Metropolis-SemiBold", size: 16)
        label.textColor = UIColor(named: "GrayCustom")
        
        return label
    }()
    
    //MARK: DateLabel
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "24 Nov 2020, 02:38 PM"
        label.font = UIFont(name: "Metropolis-Regular", size: 12)
        label.textColor = UIColor(named: "LightGrayCustom")
        
        return label
    }()
    
    //MARK: StackView
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(width configure: Notation) {
        nameLabel.text = configure.title
        dateLabel.text = configure.date.description
    }
    
    private func setupViews() -> () {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
        self.addSubview(stackView)
    }
    
    private func setupConstrains() -> () {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
        ])
    }
}
