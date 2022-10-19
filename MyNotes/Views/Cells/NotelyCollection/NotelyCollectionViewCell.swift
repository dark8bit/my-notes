//
//  NotelyCollectionViewCell.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 26.09.2022.
//

import UIKit

class NotelyCollectionViewCell: UICollectionViewCell {
    static let identifier = "NotelyCollectionViewCell"
    
    public var notely: Notation? {
        didSet {
            guard let notelyItem = notely else {return}
            
            infoView.configure(width: notelyItem)
            descriptionLabel.attributedText = NSAttributedString(string: notelyItem.description).withLineSpacing(13)
        }
    }
    
    //MARK: Side Margin
    private let sideMargin: CGFloat = 20

    //MARK: Side Padding
    private let sidePadding: CGFloat = 15
    
    //MARK: Element Padding
    private let elemenPadding: CGFloat = 18.5
    
    //MARK: ContainerView
    private let containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        
        view.layer.shadowOffset = .zero
        view.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.04)
        view.layer.shadowOpacity = 3
        view.layer.shadowRadius = 11
        
        return view
    }()
    
    //MARK: TypeView
    private let typeView: UIView = {
        let view = TypeView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let infoView: InfoView = {
        let view = InfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: HeadContainerView
    private let headContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: LineView
    private let lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "LineColor")
        
        return view
    }()
    
    //MARK: Image View
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Rectangle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont(name: "Metropolis-Regular", size: 15)
        label.textColor = UIColor(named: "GrayCustom")
        
        let text = ""
        
        let example = NSAttributedString(string: text).withLineSpacing(13)
        
        label.attributedText = example
        
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
    }
    
    //MARK: Setup Views
    private func setupViews() -> Void {
        headContainerView.addSubview(typeView)
        headContainerView.addSubview(infoView)
        
        containerView.addSubview(headContainerView)
        containerView.addSubview(lineView)
        containerView.addSubview(imageView)
        containerView.addSubview(descriptionLabel)
        
        contentView.addSubview(containerView)
    }
    
    //MARK: Setup Constrains
    private func setupConstrains() -> Void {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (sidePadding * 2)),
            
            containerView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: elemenPadding),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            typeView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: elemenPadding),
            typeView.widthAnchor.constraint(equalToConstant: typeView.frame.size.width),
            typeView.heightAnchor.constraint(equalToConstant: typeView.frame.size.height),
            
            infoView.topAnchor.constraint(equalTo: typeView.topAnchor, constant: 0),
            infoView.bottomAnchor.constraint(equalTo: typeView.bottomAnchor, constant: 0),
            infoView.leftAnchor.constraint(equalTo: typeView.rightAnchor, constant: 14),
            
            headContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: elemenPadding),
            headContainerView.bottomAnchor.constraint(equalTo: typeView.bottomAnchor, constant: 0),
            headContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: sidePadding),
            headContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -sidePadding),
            
            lineView.topAnchor.constraint(equalTo: headContainerView.bottomAnchor, constant: elemenPadding),
            lineView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: sidePadding),
            lineView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -sidePadding),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            imageView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: elemenPadding),
            imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: sidePadding),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -sidePadding),
            imageView.heightAnchor.constraint(equalToConstant: 159),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: elemenPadding),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -sidePadding),
            descriptionLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: sidePadding),
            descriptionLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -elemenPadding),
        ])
    }
}


