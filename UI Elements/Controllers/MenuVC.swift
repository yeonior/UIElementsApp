//
//  MenuVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

final class MenuVC: UIViewController, TitleAndColorProvider {
    
    private lazy var myScrollView = UIScrollView()
    private lazy var myStackView = UIStackView()
    private var firstAppearanceKey = false
    
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
    
    private lazy var scrollViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "ScrollView")
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .normal)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .highlighted)
        return button
    }()
    
    private lazy var textFieldButton: MyCustomButton = {
        let button = MyCustomButton(title: "TextField")
        return button
    }()
    
    private lazy var textViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "TextView")
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
    
    private lazy var segmentedControlButton: MyCustomButton = {
        let button = MyCustomButton(title: "SegmentedControl")
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
    
    private lazy var stackViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "StackView")
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .normal)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .highlighted)
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
    
    private lazy var activityIndicatorViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "ActivityIndicatorView")
        return button
    }()
    
    private lazy var progressViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "ProgressView")
        return button
    }()
    
    private lazy var navigationControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "NavigationController")
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .normal)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .highlighted)
        return button
    }()
    
    private lazy var tabBarControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "TabBarController")
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
    
    private lazy var tableViewControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "TableViewController")
        return button
    }()
    
    private lazy var searchControllerButton: MyCustomButton = {
        let button = MyCustomButton(title: "SearchController")
        button.backgroundColor = .lightGray.withAlphaComponent(0.3)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .normal)
        button.setTitleColor(.label.withAlphaComponent(0.5), for: .highlighted)
        return button
    }()
    
    private lazy var collectionViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "CollectionView")
        return button
    }()
    
    private lazy var webViewButton: MyCustomButton = {
        let button = MyCustomButton(title: "WebView")
        button.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).withAlphaComponent(0.5)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myScrollView)
        configureNavigationBar()
        configureScrollView()
        configureButtons()        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // makes scroll view's content size bigger and pin it
        if !firstAppearanceKey {
            myScrollView.contentSize = CGSize(width: view.bounds.size.width,
                                              height: myStackView.bounds.size.height + 80)
            firstAppearanceKey = true
            
            // scrolling to bottom
            myScrollView.scrollsToBottom(animated: true)
        }
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Navigation bar configuring
    private func configureNavigationBar() {
        
        let randomBarButtonItem = UIBarButtonItem(title: "Random", style: .plain, target: self, action: #selector(buttonDidTouchUpInside(_:)))
        let infoImage = UIImage(systemName: "info.circle")
        let infoBarButtonItem = UIBarButtonItem(image: infoImage, style: .plain, target: self, action: #selector(showInfo))
        navigationItem.rightBarButtonItem = randomBarButtonItem
        navigationItem.leftBarButtonItem = infoBarButtonItem
    }
    
    @objc private func showInfo() {
        pushAlertController(withTitle: .info, andMessage: "The UIKit framework provides the core objects that need to build apps for iOS.\n\nHere are shown the most frequently used elements of this framework.\n\nIn addition to the above, WebView is also included here, but it’s not the object of UIKit (it relates to WebKit). It is for that reason this element is colored orange.")
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
            scrollViewButton,
            textFieldButton,
            textViewButton,
            switchButton,
            sliderButton,
            segmentedControlButton,
            pickerViewButton,
            datePickerButton,
            stackViewButton,
            alertControllerButton,
            activityViewControllerButton,
            activityIndicatorViewButton,
            progressViewButton,
            navigationControllerButton,
            tabBarControllerButton,
            pageViewControllerButton,
            tableViewButton,
            tableViewControllerButton,
            searchControllerButton,
            collectionViewButton,
            webViewButton
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
        
        var button = sender
        var vc = UIViewController()
        
        // choosing a random button
        if button == navigationItem.rightBarButtonItem {
            let buttons = [
                viewButton,
                labelButton,
                buttonButton,
                imageViewButton,
                textFieldButton,
                textViewButton,
                switchButton,
                sliderButton,
                segmentedControlButton,
                pickerViewButton,
                datePickerButton,
                alertControllerButton,
                activityViewControllerButton,
                activityIndicatorViewButton,
                progressViewButton,
                tabBarControllerButton,
                pageViewControllerButton,
                tableViewButton,
                tableViewControllerButton,
                collectionViewButton,
                webViewButton
            ]
            guard let randomButton = buttons.randomElement() else { return }
            button = randomButton
        }
        
        switch button {
        case viewButton: vc = ViewVC(title: "UIView",
                                                 backgroundColor: .systemBackground)
        case labelButton: vc = LabelVC(title: "UILabel",
                                                   backgroundColor: .systemBackground)
        case buttonButton: vc = ButtonVC(title: "UIButton",
                                                     backgroundColor: .white)
        case imageViewButton: vc = ImageViewVC(title: "UIImageView",
                                                           backgroundColor: .systemBackground)
        case scrollViewButton:
            pushAlertController(withTitle: .button,
                                andMessage: "Try to check out the menu page to find it")
            return
        case textFieldButton: vc = TextFieldVC(title: "UITextField",
                                               backgroundColor: .systemBackground)
        case textViewButton: vc = TextViewVC(title: "UITextView",
                                                         backgroundColor: .systemBackground)
        case switchButton: vc = SwitchVC(title: "UISwitch",
                                                     backgroundColor: .white)
        case sliderButton: vc = SliderVC(title: "UISlider",
                                                     backgroundColor: .black)
        case segmentedControlButton: vc = SegmentedControlVC(title: "UISegmentedControl",
                                                             backgroundColor: .systemBackground)
        case pickerViewButton: vc = PickerViewVC()
        case datePickerButton: vc = DatePickerVC(title: "UIDatePicker",
                                                             backgroundColor: .systemBackground)
        case stackViewButton:
            pushAlertController(withTitle: .button,
                                andMessage: "Look at all these buttons, they are combined in a stackview")
            return
        case alertControllerButton: vc = AlertControllerVC(title: "UIAlertController",
                                                           backgroundColor: .systemBackground)
        case activityViewControllerButton: vc = ActivityViewControllerVC(title: "UIActivityController",
                                                                         backgroundColor: .systemBackground)
        case activityIndicatorViewButton: vc = ActivityIndicatorViewVC(title: "ActivityIndicatorView", backgroundColor: .systemBackground)
        case progressViewButton: vc = ProgressViewVC(title: "UIProgressView",
                                                     backgroundColor: .systemBackground)
        case navigationControllerButton:
            pushAlertController(withTitle: .button,
                                andMessage: "Navigation controller is presented on every page, but embedded only on the main page")
            return
        case tabBarControllerButton: vc = TabBarControllerVC(title: "UITabBarController",
                                                             backgroundColor: .systemBackground)
        case pageViewControllerButton: vc = PageViewControllerVC()
        case tableViewButton: vc = TableViewVC(title: "UITableView",
                                               backgroundColor: .systemBackground)
        case tableViewControllerButton: vc = TableViewControllerVC(title: "UITableViewController",
                                                                   backgroundColor: .systemGroupedBackground)
        case searchControllerButton:
            pushAlertController(withTitle: .button,
                                andMessage: "Search controller is hiding inside UITableViewController")
            return
        case collectionViewButton: vc = CollectionViewVC(title: "UICollectionView",
                                                         backgroundColor: .systemBackground)
        case webViewButton:
            vc = WebViewVC()
            let navigationVC = UINavigationController(rootViewController: vc)
            present(navigationVC, animated: true, completion: nil)
            return
        default: break
        }
        navigationController?.pushViewController(vc, animated: true)
    }
        
    // for title of alerts
    private enum AlertControllerTitle {
        case info
        case button
    }
    
    // pushing an alert
    private func pushAlertController(withTitle title: AlertControllerTitle, andMessage message: String) {
        
        var defaultTitle = ""
        
        switch title {
        case .info:
            defaultTitle = "Welcome to UIKit!"
        case .button:
            defaultTitle = "This element already implemented in other places"
        }
        
        let alertController = UIAlertController(title: defaultTitle,
                                                message: "\n" + message,
                                                preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}
