//
//  MyCollectionViewCell.swift
//  UI Elements
//
//  Created by ruslan on 17.08.2021.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "house"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14.0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.clipsToBounds = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        layer.cornerRadius = 16
        addSubview(myImageView)
        addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        myImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myLabel.frame = CGRect(x: 0, y: 100, width: 100, height: 40)
    }
    
    public func configure(labelText: String, imageName: String) {
        myLabel.text = labelText
        guard let image = UIImage(systemName: imageName) else { return }
        myImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
    }
}
