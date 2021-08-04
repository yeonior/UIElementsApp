//
//  MyCustomButton.swift
//  UI Elements
//
//  Created by ruslan on 04.08.2021.
//

import UIKit

class MyCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)
        layer.cornerRadius = 15
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        
        setTitleColor(.label.withAlphaComponent(1), for: .normal)
        setTitleColor(.label.withAlphaComponent(0.2), for: .highlighted)
        backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.862745098, blue: 0.862745098, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
