//
//  MenuVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class MenuVC: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        view.backgroundColor = .systemBackground
        configureButtons()
    }
    
    func configureButtons() {
        
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
            activityViewControllerButton
        ]
        for button in buttons {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 52).isActive = true
            button.addTarget(self, action: #selector(pushVC(_:)), for: .touchUpInside)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    @objc func pushVC(_ sender: UIButton) {
        switch sender {
        case viewButton:
            let viewController = ViewVC()
            navigationController?.pushViewController(viewController, animated: true)
        case labelButton:
            let viewController = LabelVC()
            navigationController?.pushViewController(viewController, animated: true)
        case buttonButton:
            let viewController = ButtonVC()
            navigationController?.pushViewController(viewController, animated: true)
        case imageViewButton:
            let viewController = ImageViewVC()
            navigationController?.pushViewController(viewController, animated: true)
        case textFieldButton:
            let viewController = TextFieldVC()
            navigationController?.pushViewController(viewController, animated: true)
        case textViewButton:
            let viewController = TextViewVC()
            navigationController?.pushViewController(viewController, animated: true)
        case switchButton:
            let viewController = SwitchVC()
            navigationController?.pushViewController(viewController, animated: true)
        case sliderButton:
            let viewController = SliderVC()
            navigationController?.pushViewController(viewController, animated: true)
        case pickerViewButton:
            let viewController = PickerViewVC()
            navigationController?.pushViewController(viewController, animated: true)
        case datePickerButton:
            let viewController = DatePickerVC()
            navigationController?.pushViewController(viewController, animated: true)
        case segmentedControlButton:
            let viewController = SegmentedControlVC()
            navigationController?.pushViewController(viewController, animated: true)
        case alertControllerButton:
            let viewController = AlertControllerVC()
            navigationController?.pushViewController(viewController, animated: true)
        case activityViewControllerButton:
            let viewController = ActivityViewControllerVC()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            break
        }
    }
}
