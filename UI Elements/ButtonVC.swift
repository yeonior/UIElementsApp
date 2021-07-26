//
//  ButtonVC.swift
//  UI Elements
//
//  Created by ruslan on 16.07.2021.
//

import UIKit

class ButtonVC: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIButton"
        configureButton()
    }
    
    private func configureButton() {
        
        button.setTitle("Press me", for: .normal)
        button.setTitle("Now release me", for: .highlighted)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        button.layer.cornerRadius = 15
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        
        button.setTitleColor(.black.withAlphaComponent(1), for: .normal)
        button.setTitleColor(.black.withAlphaComponent(0.5), for: .highlighted)
        button.backgroundColor = .systemGray5
        
        button.addTarget(self, action: #selector(touchedDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(touchedUpInside(_:)), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func touchedDown(_ sender: UIButton) {
        guard sender == button else { return }
        view.backgroundColor = .black
    }
    
    @objc private func touchedUpInside(_ sender: UIButton) {
        guard sender == button else { return }
        view.backgroundColor = .systemBackground
    }
}
