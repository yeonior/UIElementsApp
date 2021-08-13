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
        view.addSubview(myView)
        configureView()
    }
    
    // MARK: - View configuring
    
    private func configureView() {
        
        // attributes
        myView.backgroundColor = .systemGray5
        myView.layer.cornerRadius = 15
        
        // constraints
        myView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myView.heightAnchor.constraint(equalTo: myView.widthAnchor)
        ])
    }
}
