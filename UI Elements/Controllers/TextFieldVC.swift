//
//  TextFieldVC.swift
//  UI Elements
//
//  Created by ruslan on 02.08.2021.
//

import UIKit

class TextFieldVC: UIViewController {
    
    let myTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        title = "UITextField"
        view.backgroundColor = .systemBackground
        configureTextField()
    }
    
    private func configureTextField() {
        
        myTextField.delegate = self
        
        myTextField.borderStyle = .roundedRect
        myTextField.placeholder = "Write something here"
        myTextField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20.0)
        myTextField.textAlignment = .left
        myTextField.clearButtonMode = .whileEditing
        myTextField.keyboardType = .emailAddress
        myTextField.returnKeyType = .done
        
        view.addSubview(myTextField)
        
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextField.resignFirstResponder()
    }
    
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

extension TextFieldVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.backgroundColor = .systemGray4
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.backgroundColor = .systemBackground
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }
}
