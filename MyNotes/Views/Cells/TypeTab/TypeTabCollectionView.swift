//
//  TypeTabCollectionView.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 30.09.2022.
//

import UIKit

protocol TypeTabCollectionViewCellDelegate: AnyObject {
    func tabClicked(item: TypeTab)
}

class TypeTabCollectionViewCell: UICollectionViewCell {
    static let identifier = "TypeTabCollectionViewCell"
    
    public var typeTab: TypeTab!
    
    weak var delegate: TypeTabCollectionViewCellDelegate?
    
    //MARK: ContainerView
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(named: "Active")
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    //MARK: Label View
    private lazy var labelView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Metropolis-Regular", size: 15)
        label.textColor = UIColor(named: "ActiveText")
        label.isUserInteractionEnabled = true
        
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked))
        label.addGestureRecognizer(guestureRecognizer)
        
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func configure(with configure: TypeTab) {
        labelView.text = configure.name.rawValue
        
        isActiveCell(checked: configure.isChecked)
    }
    
    @objc private func labelClicked() -> () {
        delegate?.tabClicked(item: typeTab)
    }
    
    private func setupViews() -> Void {
        containerView.addSubview(labelView)
        
        contentView.addSubview(containerView)
    }
    
    private func isActiveCell(checked: Bool) -> () {
        let backgorundColor = checked ? UIColor(named: "Active") : UIColor(named: "Emable")
        let textColor = checked ? UIColor(named: "ActiveText") : UIColor(named: "EmableText")
        containerView.backgroundColor = backgorundColor
        labelView.textColor = textColor
    }
    
    private func setupConstrains() -> Void {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            labelView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6),
            labelView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6),
            labelView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 11),
            labelView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -11),
        ])
    }
}
