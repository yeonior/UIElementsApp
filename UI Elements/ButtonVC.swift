//
//  ButtonVC.swift
//  UI Elements
//
//  Created by ruslan on 16.07.2021.
//

import UIKit

class ButtonVC: UIViewController {
    
    @IBOutlet weak var buttonToNextVC: UIButton!
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonToNextVC.layer.cornerRadius = 15
        configureButton()
    }
    
    private func configureButton() {
        
        button.setTitle("Press me", for: .normal)
        button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        button.layer.cornerRadius = 15
        
        button.setTitleColor(.black.withAlphaComponent(1), for: .normal)
        button.setTitleColor(.black.withAlphaComponent(0.5), for: .highlighted)
        button.backgroundColor = .systemGray5
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchDown)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func buttonAction(sender: UIButton) {
        guard sender == button else { return }
        
        print("OK")
    }
}
