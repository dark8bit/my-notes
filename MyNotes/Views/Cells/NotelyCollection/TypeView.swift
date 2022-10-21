//
//  TypeView.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 29.09.2022.
//

import UIKit

class TypeView: UIView {
    //MARK: TypeView
    private let typeView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.layer.cornerRadius = view.frame.width / 2
        view.backgroundColor = UIColor(named: "BlueType")
        
        return view
    }()
    
    //MARK: TypeImageView
    private let typeImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "scribble")
        imageView.tintColor = .white
        
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(contentType: ContentType) -> () {
        typeImageView.image = UIImage(systemName: contentType.icon.rawValue)
        typeView.backgroundColor = UIColor(named: contentType.color.rawValue)
    }
    
    private func setupViews() -> () {
        typeView.addSubview(typeImageView)
        self.addSubview(typeView)
    }
    
    private func setupConstrains() -> () {
        NSLayoutConstraint.activate([
            typeImageView.centerXAnchor.constraint(equalTo: typeView.centerXAnchor),
            typeImageView.centerYAnchor.constraint(equalTo: typeView.centerYAnchor),
        ])
    }
}
