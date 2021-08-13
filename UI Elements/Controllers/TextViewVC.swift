//
//  TextViewVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

final class TextViewVC: UIViewController {
      
    private let myTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding observers to adjust for keyboard
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        title = "UITextView"
        view.backgroundColor = .systemBackground
        view.addSubview(myTextView)
        configureTextView()
    }
    
    // MARK: - Text view configuring
    
    private func configureTextView() {
        
        // attributes
        myTextView.text = "Write something here"
        myTextView.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)        
        myTextView.textAlignment = .center
        myTextView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        myTextView.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        myTextView.textContainer.lineBreakMode = .byCharWrapping
        myTextView.layer.cornerRadius = 15
        
        // colors
        myTextView.backgroundColor = .systemGray5
        
        // constraints
        myTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myTextView.heightAnchor.constraint(equalTo: myTextView.widthAnchor)
        ])
    }
    
    // keybord hiding by a tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextView.resignFirstResponder()
    }
    
    // view configuring due to keyboard apperance
    @objc private func adjustForKeyboard(notification: Notification) {
        
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardViewEndFrame = view.convert(keyboardValue.cgRectValue, from: view.window)
        let keyboardHeight = keyboardViewEndFrame.height
        
        if notification.name == UIResponder.keyboardWillShowNotification {
            self.view.frame.origin.y = (statusBarHeight + navigationBarHeight - keyboardHeight) / 2
        } else {
            self.view.frame.origin.y = .zero
        }
    }
}
