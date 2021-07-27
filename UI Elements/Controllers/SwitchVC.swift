//
//  SwitchVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class SwitchVC: UIViewController {
    
    let mySwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UISwitch"
        view.backgroundColor = .white
        configureSwitch()
    }
    
    private func configureSwitch() {
        
        mySwitch.setOn(true, animated: true)
                
        mySwitch.tintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        mySwitch.onTintColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        mySwitch.thumbTintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        mySwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        
        view.addSubview(mySwitch)
        
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mySwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func switchStateDidChange(_ sender: UISwitch) {
        guard sender == mySwitch else { return }
        
        if sender.isOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
    }
}
