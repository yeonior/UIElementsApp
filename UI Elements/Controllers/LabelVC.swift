//
//  ViewController.swift
//  UI Elements
//
//  Created by ruslan on 14.07.2021.
//

import UIKit

class LabelVC: UIViewController {
    
    let myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UILabel"
        configureLabel()
    }

    private func configureLabel() {

        myLabel.text = "I'm a label"
        myLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        myLabel.textAlignment = .center
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.clipsToBounds = true
        myLabel.layer.cornerRadius = 15
        
        myLabel.backgroundColor = .systemGray5

        view.addSubview(myLabel)

        myLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            myLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            myLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            myLabel.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: 20),
            myLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20),
            myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myLabel.widthAnchor.constraint(equalToConstant: 200),
            myLabel.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

// another way to implement a label

extension LabelVC {
    
//    private func configureLabel() {
//
//        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
////        label.center = view.center
//        label.layer.masksToBounds = true
//        label.layer.cornerRadius = 15
//
//        label.text = "Something"
//        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        
//        // first way of autoresizing
////        label.sizeToFit()
//        
//        // second way of autoresizing
////        label.numberOfLines = 1 // should be 1
////        label.adjustsFontSizeToFitWidth = true
////        label.minimumScaleFactor = 0.1
//
//        label.textColor = .darkGray
//        label.backgroundColor = .systemGray5
//        
//        view.addSubview(label)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        
//        // leading
//        NSLayoutConstraint(item: label,
//                           attribute: .leading,
//                           relatedBy: .greaterThanOrEqual,
//                           toItem: view,
//                           attribute: .leadingMargin,
//                           multiplier: 1.0,
//                           constant: 20.0).isActive = true
//
//        // trailing
//        NSLayoutConstraint(item: label,
//                           attribute: .trailingMargin,
//                           relatedBy: .lessThanOrEqual,
//                           toItem: view,
//                           attribute: .trailingMargin,
//                           multiplier: 1.0,
//                           constant: -20.0).isActive = true
//
//        // top
//        NSLayoutConstraint(item: label,
//                           attribute: .top,
//                           relatedBy: .greaterThanOrEqual,
//                           toItem: view,
//                           attribute: .topMargin,
//                           multiplier: 1.0,
//                           constant: 20.0).isActive = true
//
//        // bottom
//        NSLayoutConstraint(item: label,
//                           attribute: .bottom,
//                           relatedBy: .lessThanOrEqual,
//                           toItem: view,
//                           attribute: .bottomMargin,
//                           multiplier: 1.0,
//                           constant: -20.0).isActive = true
//
//        // center X
//        NSLayoutConstraint(item: label,
//                           attribute: .centerX,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerX,
//                           multiplier: 1.0,
//                           constant: 0.0).isActive = true
//
//        // center Y
//        NSLayoutConstraint(item: label,
//                           attribute: .centerY,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .centerY,
//                           multiplier: 1.0,
//                           constant: 0.0).isActive = true
//
//        // width = height
//        NSLayoutConstraint(item: label,
//                           attribute: .width,
//                           relatedBy: .equal,
//                           toItem: label,
//                           attribute: .height,
//                           multiplier: 1.0,
//                           constant: 0.0).isActive = true
//
//        // width
//        NSLayoutConstraint(item: label,
//                           attribute: .width,
//                           relatedBy: .greaterThanOrEqual,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1.0,
//                           constant: label.frame.size.width).isActive = true
//
//        // height
//        NSLayoutConstraint(item: label,
//                           attribute: .height,
//                           relatedBy: .greaterThanOrEqual,
//                           toItem: nil,
//                           attribute: .notAnAttribute,
//                           multiplier: 1.0,
//                           constant: label.frame.size.height).isActive = true
//    }
}
