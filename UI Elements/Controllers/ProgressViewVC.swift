//
//  ProgressViewVC.swift
//  UI Elements
//
//  Created by ruslan on 08.08.2021.
//

import UIKit

final class ProgressViewVC: UIViewController {
    
    private let myProgressView = UIProgressView()
    private let button: MyCustomButton = {
        let button = MyCustomButton(title: "Start")
        button.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).withAlphaComponent(0.5)
        return button
    }()
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UIProgressView"
        view.backgroundColor = .systemBackground
        view.addSubview(myProgressView)
        view.addSubview(button)
        configureProgressView()
        configureButton()
    }
    
    // MARK: - Progress view configuring
    
    private func configureProgressView() {
        
        // attributes
        myProgressView.progressViewStyle = .default
        myProgressView.setProgress(0.0, animated: false)
        
        // color
        myProgressView.trackTintColor = .systemGray6
        
        // constraints
        myProgressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myProgressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myProgressView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            myProgressView.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
    
    // MARK: - Button configuring
    
    private func configureButton() {
        
        // action
        button.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
        
        // constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            button.heightAnchor.constraint(equalToConstant: 52),
            button.topAnchor.constraint(equalTo: myProgressView.bottomAnchor, constant: 50)
        ])
    }
    
    // starting the fake loading
    @objc private func buttonDidTouchUpInside(_ button: UIButton) {
        
        myProgressView.progressTintColor = UIColor.random
        
        // MARK: Timer configuring
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateProgressView),
                                     userInfo: nil,
                                     repeats: true)
        
        button.setTitle("Loading...", for: .normal)
        button.alpha = 0.2
        button.isUserInteractionEnabled = false
    }
    
    // updating progress
    @objc private func updateProgressView() {
        
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.2
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.5) {
                self.myProgressView.progress = 0.0
                self.button.setTitle("Start", for: .normal)
                self.button.alpha = 1.0
                self.button.isUserInteractionEnabled = true
                self.timer.invalidate()
            }
        }
    }
}
