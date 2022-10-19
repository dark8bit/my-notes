//
//  StartViewController.swift
//  Coordinate
//
//  Created by Владислав Клепиков on 21.09.2022.
//  Copyright © 2022 thoughtbot. All rights reserved.
//

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    func showMainViewController()
  }


final class StartViewController: UIViewController {
    weak var delegate: StartViewControllerDelegate?
    
    private let containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Metropolis-Black", size: 35)
        label.textColor = UIColor(named: "GrayCustom")
        label.text = "Notely"
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Metropolis-Regular", size: 16)
        label.textColor = UIColor(named: "GrayCustom")
        label.numberOfLines = 0
        
        let text = """
            Capture what's on your mind & get a
            reminder later at the right place or time.
            You can also add voice memo & other
            features
        """
        let example = NSAttributedString(string: text).withLineSpacing(18)
        label.attributedText = example
        
        return label
    }()
    
    
    @IBAction func signOutPressed(_ sender: Any) {
      delegate?.showMainViewController()
    }
    
    private let listImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "List")
        
        return imageView
    }()
    
    private let buttonStart: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Let's Start", for: .normal)
        button.titleLabel?.font = UIFont(name: "Metropolis-SemiBold", size: 16)
        button.backgroundColor = UIColor(named: "PurpleCustom")
        
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 15, left: 24, bottom: 15, right: 24)
        
        let icon = UIImage(named: "plus")!
        button.setImage(icon, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -15)
        
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.33)
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        
        button.addTarget(self, action: #selector(showMainViewControllerPressed), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstrains()
    }
    
    @objc private func showMainViewControllerPressed() -> () {
        delegate?.showMainViewController()
    }
    
    private func setupViews() -> Void {
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(listImage)
        containerView.addSubview(buttonStart)
        
        view.addSubview(containerView)
    }

    private func setupConstrains() -> Void {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 137),
            titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 27),
            
            listImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 49),
            listImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            listImage.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            listImage.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            
            buttonStart.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -43),
            buttonStart.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
        ])
        
    }
}
