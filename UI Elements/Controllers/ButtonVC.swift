//
//  ButtonVC.swift
//  UI Elements
//
//  Created by ruslan on 16.07.2021.
//

import UIKit

final class ButtonVC: UIViewController, TitleAndColorProvider {
    
    private let myButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myButton)
        configureButton()
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button configuring
    
    private func configureButton() {
        
        // attributes
        myButton.setTitle("Press me", for: .normal)
        myButton.setTitle("Now release me", for: .highlighted)
        myButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        myButton.layer.cornerRadius = 15
        myButton.titleLabel?.numberOfLines = 0
        myButton.titleLabel?.textAlignment = .center
        
        // colors
        myButton.setTitleColor(.label.withAlphaComponent(1), for: .normal)
        myButton.setTitleColor(.label.withAlphaComponent(0.2), for: .highlighted)
        myButton.backgroundColor = .systemGray5
        
        // adding actions
        myButton.addTarget(self, action: #selector(buttonDidTouchDown(_:)), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
        
        // constraints
        myButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myButton.heightAnchor.constraint(equalTo: myButton.widthAnchor)
        ])
    }
    
    // button actions
    
    @objc private func buttonDidTouchDown(_ sender: UIButton) {
        guard sender == myButton else { return }
        view.backgroundColor = .black
    }
    
    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        guard sender == myButton else { return }
        view.backgroundColor = .white
    }
}
