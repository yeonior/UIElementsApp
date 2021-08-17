//
//  TextFieldVC.swift
//  UI Elements
//
//  Created by ruslan on 02.08.2021.
//

import UIKit

final class TextFieldVC: UIViewController, TitleAndColorProvider {
    
    private let myTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding observers to adjust for keyboard
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addSubview(myTextField)
        myTextField.delegate = self
        configureTextField()
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Text field configuring
    
    private func configureTextField() {
        
        // attributes
        myTextField.borderStyle = .roundedRect
        myTextField.placeholder = "Write something here"
        myTextField.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14.0)
        myTextField.textAlignment = .left
        myTextField.clearButtonMode = .whileEditing
        myTextField.keyboardType = .emailAddress
        myTextField.returnKeyType = .done
        
        // constraints
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    // keybord hiding by a tap
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextField.resignFirstResponder()
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

// MARK: - Text field delegate

extension TextFieldVC: UITextFieldDelegate {
    
    // editing begin
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.backgroundColor = .systemGray3
    }
    
    // editing end
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.backgroundColor = .systemBackground
    }
    
    // keybord hiding by a return (done) button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }
}
