//
//  ViewController.swift
//  UI Elements
//
//  Created by ruslan on 14.07.2021.
//

import UIKit

class Label: UIViewController {
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel()
    }
    
    fileprivate func configureLabel() {
        
        // frame and location
        
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.center = view.center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15 // masksToBounds should be true
        
        // attributes
        
        label.text = "Something goes wrong! Error 121"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        // first way of autoresizing
        label.sizeToFit()
        
        // second way of autoresizing
//        label.numberOfLines = 1 // should be 1
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.1
        
        // colors
        
        label.textColor = .darkGray
        label.backgroundColor = .systemGray5
        
        view.addSubview(label)
    }
}
