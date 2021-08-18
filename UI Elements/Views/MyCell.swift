//
//  MyCell.swift
//  UI Elements
//
//  Created by ruslan on 17.08.2021.
//

import UIKit

// MARK: Cell size constants
struct cellSizeConstants {
    static let distanceToBorder: CGFloat = UIScreen.main.bounds.width * 0.08
    static let minimumLineSpacing: CGFloat = UIScreen.main.bounds.width * 0.05
    static let itemWidth: CGFloat = (UIScreen.main.bounds.width - distanceToBorder * 2 - minimumLineSpacing) / 1.3
}

final class MyCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    
    // MARK: Image view configuring
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "nosign")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Name label configuring
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "n/a"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 32.0)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: List label configuring
    private let listLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: - Cell configuring (init)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // adding subviews
        contentView.addSubview(myImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(listLabel)
        
        // attributes
        contentView.backgroundColor = .tertiarySystemGroupedBackground
        if traitCollection.userInterfaceStyle == .light {
            contentView.layer.shadowColor = UIColor.black.cgColor
        } else {
            contentView.layer.shadowColor = UIColor.white.cgColor
        }
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowRadius = 7
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        // constraints
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        myImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        myImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        myImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        listLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        listLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        listLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        listLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // changing attributes when interface environment changing
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.userInterfaceStyle == .light {
            contentView.layer.shadowColor = UIColor.white.cgColor
        } else {
            contentView.layer.shadowColor = UIColor.black.cgColor
        }
    }
    
    // setting up data
    public func setUpData(labelText: String, imageName: String, array: [Product]) {
        nameLabel.text = labelText
        listLabel.text = ""
        for product in array {
            listLabel.text! += "- " + product.name.lowercased() + "\n"
        }
        guard let image = UIImage(named: imageName) else { return }
        myImageView.image = image
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        myLabel.text = nil
//        myImageView.image = nil
//    }
}
