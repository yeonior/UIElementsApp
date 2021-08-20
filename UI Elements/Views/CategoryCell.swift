//
//  CategoryCell.swift
//  UI Elements
//
//  Created by ruslan on 19.08.2021.
//

import UIKit

// MARK: Cell size constants
struct CategoryCellSizeConstants {
    static let distanceToBorder: CGFloat = UIScreen.main.bounds.width * 0.08
    static let minimumLineSpacing: CGFloat = UIScreen.main.bounds.width * 0.05
    static let itemWidth: CGFloat = (UIScreen.main.bounds.width - distanceToBorder * 2 - minimumLineSpacing) / 2
}

final class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.clipsToBounds = true
        return label
    }()
    
    // MARK: Price label configuring
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        label.textColor = .gray
        label.textAlignment = .right
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.clipsToBounds = true        
        return label
    }()
    
    // MARK: - Cell configuring (init)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // adding subviews
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
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
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        priceLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
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
    public func setUpData(labelText: String, imageName: String, cost: Int) {
        nameLabel.text = labelText
        priceLabel.text = "$" + String(cost)
        guard let image = UIImage(named: imageName) else { return }
        imageView.image = image
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageView.image = nil
//        nameLabel.text = nil
//        priceLabel.text = nil
//    }
}
