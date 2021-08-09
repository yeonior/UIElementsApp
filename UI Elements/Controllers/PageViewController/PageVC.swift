//
//  PageVC.swift
//  UI Elements
//
//  Created by ruslan on 09.08.2021.
//

import UIKit

final class PageVC: UIViewController {

    private let emojiLabel: UILabel = {
        let emoji = UILabel()
        emoji.font = UIFont.systemFont(ofSize: 150)
        emoji.textAlignment = .center
        emoji.adjustsFontSizeToFitWidth = true
        emoji.minimumScaleFactor = 0.5
        return emoji
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        description.textAlignment = .center
        description.numberOfLines = 0
        description.adjustsFontSizeToFitWidth = true
        description.minimumScaleFactor = 0.7
        return description
    }()
    
    lazy var subView = [emojiLabel, descriptionLabel]
    
    init(page: PageHelper) {
        super.init(nibName: nil, bundle: nil)
        
        emojiLabel.text = page.emoji
        descriptionLabel.text = page.description
        
        view.backgroundColor = .systemBackground
        
        for view in subView {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            emojiLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            descriptionLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 100),
            descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
