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
        
        // attributes
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        titleLabel?.numberOfLines = 1
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.7
        titleLabel?.textAlignment = .center
        
        // layer
        layer.cornerRadius = 15
        layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
//        if traitCollection.userInterfaceStyle == .light {
//            layer.shadowColor = UIColor.black.cgColor
//        } else {
//            layer.shadowColor = UIColor.white.cgColor
//        }
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        layer.shadowOpacity = 1.0
        
        // colors
        setTitleColor(.label.withAlphaComponent(1), for: .normal)
        setTitleColor(.label.withAlphaComponent(0.2), for: .highlighted)
        backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.862745098, blue: 0.862745098, alpha: 1).withAlphaComponent(0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        if previousTraitCollection?.userInterfaceStyle == .light {
//            layer.shadowColor = UIColor.white.cgColor
//        } else {
//            layer.shadowColor = UIColor.black.cgColor
//        }
//    }
}
