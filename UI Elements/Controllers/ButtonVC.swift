//
//  ButtonVC.swift
//  UI Elements
//
//  Created by ruslan on 16.07.2021.
//

import UIKit

class ButtonVC: UIViewController {
    
    let myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIButton"
        view.backgroundColor = .white
        configureButton()
    }
    
    private func configureButton() {
        
        myButton.setTitle("Press me", for: .normal)
        myButton.setTitle("Now release me", for: .highlighted)
        myButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        myButton.layer.cornerRadius = 15
        myButton.titleLabel?.numberOfLines = 0
        myButton.titleLabel?.textAlignment = .center
        
        myButton.setTitleColor(.label.withAlphaComponent(1), for: .normal)
        myButton.setTitleColor(.label.withAlphaComponent(0.5), for: .highlighted)
        myButton.backgroundColor = .systemGray5
        
        myButton.addTarget(self, action: #selector(touchedDown(_:)), for: .touchDown)
        myButton.addTarget(self, action: #selector(touchedUpInside(_:)), for: .touchUpInside)
        
        view.addSubview(myButton)
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myButton.heightAnchor.constraint(equalTo: myButton.widthAnchor)
        ])
    }
    
    @objc private func touchedDown(_ sender: UIButton) {
        guard sender == myButton else { return }
        view.backgroundColor = .black
    }
    
    @objc private func touchedUpInside(_ sender: UIButton) {
        guard sender == myButton else { return }
        view.backgroundColor = .white
    }
}
