//
//  ImageViewVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

final class ImageViewVC: UIViewController {
    
    private let myImageView = UIImageView()
    private let myImage = UIImage(named: "hello")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIImageView"
        view.backgroundColor = .systemBackground
        configureImageView()
    }
    
    private func configureImageView() {
        
        myImageView.image = myImage
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.cornerRadius = 15
        myImageView.clipsToBounds = true

        myImageView.backgroundColor = .systemGray5
        
        view.addSubview(myImageView)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor)
        ])
    }
}
