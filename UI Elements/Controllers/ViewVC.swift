//
//  ViewVC.swift
//  UI Elements
//
//  Created by ruslan on 27.07.2021.
//

import UIKit

final class ViewVC: UIViewController {
    
    private let myView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIView"
        view.backgroundColor = .systemBackground
        configureView()
    }
    
    private func configureView() {
        
        myView.backgroundColor = .systemGray5
        myView.layer.cornerRadius = 15
        
        view.addSubview(myView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myView.heightAnchor.constraint(equalTo: myView.widthAnchor)
        ])
    }
}
