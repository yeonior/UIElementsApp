//
//  ButtonVC.swift
//  UI Elements
//
//  Created by ruslan on 16.07.2021.
//

import UIKit

class ButtonVC: UIViewController {
    
    fileprivate let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureButton()
    }
    
    @objc fileprivate func buttonPressed() {
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    }
    
    @objc fileprivate func buttonTapped() {
        view.backgroundColor = .systemBackground
    }
    
    fileprivate func configureButton() {
        
        // frame and location
        
        button.frame = CGRect(x: 110, y: 450, width: 200, height: 50)
        button.layer.cornerRadius = 15
        
        // attributes
        
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        button.setTitle("Press me", for: .normal)
        button.setTitle("I'm pressed", for: .highlighted)
        
        // colors
        
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .systemGray2
        
        // actions
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(button)
    }
}
