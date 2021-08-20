//
//  MainCell.swift
//  UI Elements
//
//  Created by ruslan on 17.08.2021.
//

import UIKit

// MARK: Cell size constants
struct MainCellSizeConstants {
    static let distanceToBorder: CGFloat = UIScreen.main.bounds.width * 0.08
    static let minimumLineSpacing: CGFloat = UIScreen.main.bounds.width * 0.05
    static let itemWidth: CGFloat = (UIScreen.main.bounds.width - distanceToBorder * 2 - minimumLineSpacing) / 1.3
}

final class MainCell: UICollectionViewCell {
    
    static let identifier = "MainCell"
    
    // MARK: Image view configuring
    private let imageView: UIImageView = {
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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 17.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.clipsToBounds = true
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Cell configuring (init)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // adding subviews
        contentView.addSubview(imageView)
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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 0.25).isActive = true
        
        listLabel.translatesAutoresizingMaskIntoConstraints = false
        listLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        listLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        listLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10).isActive = true
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
    public func setUpData(labelText: String, imageName: String, array: [ProductModel]) {
        nameLabel.text = labelText
        listLabel.text = ""
        for product in array {
            listLabel.text! += "- " + product.name.lowercased() + "\n"
        }
        guard let image = UIImage(named: imageName) else { return }
        imageView.image = image
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageView.image = nil
//        nameLabel.text = nil
//        listLabel.text = nil
//    }
}
