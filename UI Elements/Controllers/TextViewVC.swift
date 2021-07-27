//
//  TextViewVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class TextViewVC: UIViewController {
      
    let myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UITextView"
        configureTextView()
    }
    
    private func configureTextView() {
        
        myTextView.text = "Write something here"
        myTextView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)        
        myTextView.textAlignment = .center
        myTextView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        myTextView.textContainer.lineBreakMode = .byCharWrapping
        myTextView.layer.cornerRadius = 15
        
        myTextView.backgroundColor = .systemGray5
        
        view.addSubview(myTextView)
        
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myTextView.heightAnchor.constraint(equalTo: myTextView.widthAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextView.resignFirstResponder()
    }
}
