//
//  MenuVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

final class MenuVC: UIViewController {
    
    private lazy var myScrollView = UIScrollView()
    private lazy var myStackView = UIStackView()
    private var myStackViewContentSizeKey = false
    
    // buttons
    
    private lazy var viewButton: MyCustomButton = {
        let button = MyCustomButton(title: "View")
        return button
    }()
    
    private lazy var labelButton: MyCustomButton = {
        let button = MyCustomButton(title: "Label")
        return button
    }()
    
    private lazy var buttonButton: MyCustomButton = {
        let button = MyCustomButton(title: "Button")
        return button
    }()
    
    private lazy var imageViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "ImageView")
        return button
    }()
    
    private lazy var textViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "TextView")
        return button
    }()
    
    private lazy var textFieldButton: MyCustomButton = {
        let button = MyCustomButton(title: "TextField")
        return button
    }()
    
    private lazy var switchButton: MyCustomButton = {
        let button = MyCustomButton(title: "Switch")
        return button
    }()
    
    private lazy var sliderButton: MyCustomButton = {
        let button = MyCustomButton(title: "Slider")
        return button
    }()
    
    private lazy var pickerViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "PickerView")
        return button
    }()
    
    private lazy var datePickerButton: MyCustomButton = {
        let button = MyCustomButton(title: "DatePicker")
        return button
    }()
    
    private lazy var segmentedControlButton: MyCustomButton = {
        let button = MyCustomButton(title: "SegmentedControl")
        return button
    }()
    
    private lazy var alertControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "AlertController")
        return button
    }()
    
    private lazy var activityViewControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "ActivityViewController")
        return button
    }()
    
    private lazy var webViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "WebView")
        return button
    }()
    
    private lazy var progressViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "ProgressView")
        return button
    }()
    
    private lazy var pageViewControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "PageViewController")
        return button
    }()
    
    private lazy var tableViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "TableView")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        view.backgroundColor = .systemBackground
        view.addSubview(myScrollView)
        configureScrollView()
        configureButtons()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // makes scroll view's content size bigger and fixes it
        if !myStackViewContentSizeKey {
            myScrollView.contentSize = CGSize(width: view.bounds.size.width,
                                              height: myStackView.bounds.size.height + 80)
            myStackViewContentSizeKey = true
        }
//        myScrollView.scrollsToBottom(animated: true)
    }
    
    // MARK: - Scroll view configuring
    
    private func configureScrollView() {
        
        myScrollView.bounds = view.bounds
        myScrollView.backgroundColor = .systemBackground
        
        // constraints
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    // MARK: - Buttons configuring
    
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
            webViewButton,
            progressViewButton,
            pageViewControllerButton,
            tableViewButton
        ]
        
        for button in buttons {
            
            // action
            button.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
            
            // constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        }
        
        // stack view configuring
        myStackView = UIStackView(arrangedSubviews: buttons)
        myStackView.axis = .vertical
        myStackView.distribution = .fillEqually
        myStackView.spacing = 10
        
        // adding the stack view
        myScrollView.addSubview(myStackView)
        
        // constraints
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myStackView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor),
            myStackView.topAnchor.constraint(equalTo: myScrollView.topAnchor, constant: 40),
            myStackView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor, multiplier: 0.6)
        ])
    }
    
    // pushing a specific view controller
    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        
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
        case progressViewButton: viewController = ProgressViewVC()
        case pageViewControllerButton: viewController = PageViewControllerVC()
        case tableViewButton: viewController = TableViewVC()
        default: break
        }
        navigationController?.pushViewController(viewController, animated: true)
    }
}


