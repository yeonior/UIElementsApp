//
//  TextViewVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class TextViewVC: UIViewController {
    
    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureTextView()
    }
    
    private func configureTextView() {
        
        textView.text = "Write something"
        textView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)        
        textView.textAlignment = .center
        textView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.layer.cornerRadius = 15
        
        textView.backgroundColor = .systemGray5
        
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.widthAnchor.constraint(equalToConstant: 200),
            textView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
}
