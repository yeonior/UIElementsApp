//
//  MenuVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class MenuVC: UIViewController {
    
    lazy var myScrollView = UIScrollView()
    lazy var myStackView = UIStackView()
    var myStackViewContentSizeKey = false
    
    lazy var viewButton: MyCustomButton = {
        let button = MyCustomButton(title: "View")
        return button
    }()
    
    lazy var labelButton: MyCustomButton = {
        let button = MyCustomButton(title: "Label")
        return button
    }()
    
    lazy var buttonButton: MyCustomButton = {
        let button = MyCustomButton(title: "Button")
        return button
    }()
    
    lazy var imageViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "ImageView")
        return button
    }()
    
    lazy var textViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "TextView")
        return button
    }()
    
    lazy var textFieldButton: MyCustomButton = {
        let button = MyCustomButton(title: "TextField")
        return button
    }()
    
    lazy var switchButton: MyCustomButton = {
        let button = MyCustomButton(title: "Switch")
        return button
    }()
    
    lazy var sliderButton: MyCustomButton = {
        let button = MyCustomButton(title: "Slider")
        return button
    }()
    
    lazy var pickerViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "PickerView")
        return button
    }()
    
    lazy var datePickerButton: MyCustomButton = {
        let button = MyCustomButton(title: "DatePicker")
        return button
    }()
    
    lazy var segmentedControlButton: MyCustomButton = {
        let button = MyCustomButton(title: "SegmentedControl")
        return button
    }()
    
    lazy var alertControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "AlertController")
        return button
    }()
    
    lazy var activityViewControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "ActivityViewController")
        return button
    }()
    
    lazy var webViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "WebView")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        view.backgroundColor = .systemBackground
        configureScrollView()
        configureButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !myStackViewContentSizeKey {
            myScrollView.contentSize = CGSize(width: view.bounds.size.width,
                                              height: myStackView.bounds.size.height + 80)
            myStackViewContentSizeKey = true
        }
    }
    
    private func configureScrollView() {
        
        myScrollView.bounds = view.bounds
        myScrollView.backgroundColor = .systemBackground
        
        view.addSubview(myScrollView)
        
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    private func configureButtons() {
        
        let buttons = [
            viewButton,
            labelButton,
            buttonButton,
            imageViewButton,
            textFieldButton,
            textViewButton,
            switchButton,
            sliderButton,
            pickerViewButton,
            datePickerButton,
            segmentedControlButton,
            alertControllerButton,
            activityViewControllerButton,
            webViewButton
        ]
        for button in buttons {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 52).isActive = true
            button.addTarget(self, action: #selector(pushVC(_:)), for: .touchUpInside)
        }
        
        myStackView = UIStackView(arrangedSubviews: buttons)
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.spacing = 10
        
        myScrollView.addSubview(myStackView)
        
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myStackView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor),
            myStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: 40),
            myStackView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    @objc private func pushVC(_ sender: UIButton) {
        
        var viewController = UIViewController()
        
        switch sender {
        case viewButton: viewController = ViewVC()
        case labelButton: viewController = LabelVC()
        case buttonButton: viewController = ButtonVC()
        case imageViewButton: viewController = ImageViewVC()
        case textFieldButton: viewController = TextFieldVC()
        case textViewButton: viewController = TextViewVC()
        case switchButton: viewController = SwitchVC()
        case sliderButton: viewController = SliderVC()
        case pickerViewButton: viewController = PickerViewVC()
        case datePickerButton: viewController = DatePickerVC()
        case segmentedControlButton: viewController = SegmentedControlVC()
        case alertControllerButton: viewController = AlertControllerVC()
        case activityViewControllerButton: viewController = ActivityViewControllerVC()
        case webViewButton:
            viewController = WebViewVC()
            let navigationVC = UINavigationController(rootViewController: viewController)
            present(navigationVC, animated: true, completion: nil)
            return
        default: break
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}
