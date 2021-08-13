//
//  AlertControllerVC.swift
//  UI Elements
//
//  Created by ruslan on 01.08.2021.
//

import UIKit

final class AlertControllerVC: UIViewController {
    
    private let alertButton = UIButton()
    private let actionSheetButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIAlertController"
        view.backgroundColor = .systemBackground
        configureButtons()
    }
    
    // MARK: - Buttons configuring
    
    private func configureButtons() {
        
        // attributes
        alertButton.setTitle("Alert", for: .normal)
        actionSheetButton.setTitle("Action Sheet", for: .normal)
        
        let buttons = [alertButton, actionSheetButton]
        for button in buttons {
            button.layer.cornerRadius = 15
            button.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.textAlignment = .center
            
            // colors
            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).withAlphaComponent(0.5)
            button.setTitleColor(.label.withAlphaComponent(1), for: .normal)
            button.setTitleColor(.label.withAlphaComponent(0.2), for: .highlighted)
            
            // action
            button.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
            
            // constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        }
        
        // stack view configuring
        let stackView = UIStackView(arrangedSubviews: [alertButton, actionSheetButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        // adding the stack view
        view.addSubview(stackView)
        
        // constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    // alert controller creation
    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        
        if sender == alertButton {
            
            // MARK: Alert controller configuring with alert style
            
            let alertController = UIAlertController(title: "This is an alert",
                                                    message: "It displayed modally for the app",
                                                    preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            
            alertController.addAction(okButton)
            present(alertController, animated: true)
            
        } else if sender == actionSheetButton {
            
            // MARK: Alert controller configuring with action sheet style
            
            let alertController = UIAlertController(title: "This is an action sheet",
                                                    message: "It displayed by the view controller that presented it",
                                                    preferredStyle: .actionSheet)
            let okButton = UIAlertAction(title: "OK", style: .cancel)
            let ohRightButton = UIAlertAction(title: "Change buttons color", style: .default) { [unowned self] _ in
                
                // changing buttons color
                let buttons = [self.alertButton, self.actionSheetButton]
                for button in buttons {
                    button.backgroundColor = UIColor.random.withAlphaComponent(0.4)
                }
            }
            
            alertController.addAction(okButton)
            alertController.addAction(ohRightButton)
            present(alertController, animated: true)
        }
    }
}
