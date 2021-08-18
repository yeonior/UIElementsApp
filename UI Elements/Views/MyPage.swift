//
//  MyPage.swift
//  UI Elements
//
//  Created by ruslan on 09.08.2021.
//

import UIKit

final class MyPage: UIViewController {
    
    // MARK: Emoji label configuring
    private let myEmojiLabel: UILabel = {
        let emoji = UILabel()
        emoji.font = UIFont.systemFont(ofSize: 150)
        emoji.textAlignment = .center
        emoji.adjustsFontSizeToFitWidth = true
        emoji.minimumScaleFactor = 0.5
        return emoji
    }()
    
    // MARK: Description label configuring
    private let myDescriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        description.textAlignment = .center
        description.numberOfLines = 0
        description.adjustsFontSizeToFitWidth = true
        description.minimumScaleFactor = 0.5
        return description
    }()
    
    lazy private var subView = [myEmojiLabel, myDescriptionLabel]
    
    // MARK: - Page configuring (init)
    
    init(page: PageModel) {
        super.init(nibName: nil, bundle: nil)
        
        // init labels
        myEmojiLabel.text = page.emoji
        myDescriptionLabel.text = page.description
        
        // color
        view.backgroundColor = .systemBackground
        
        // adding and constraints
        
        for view in subView {
            self.view.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            myEmojiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myEmojiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            myEmojiLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            myDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            myDescriptionLabel.topAnchor.constraint(equalTo: myEmojiLabel.bottomAnchor, constant: 50),
            myDescriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
}
