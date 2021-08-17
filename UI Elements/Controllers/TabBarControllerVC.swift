//
//  TabBarControllerVC.swift
//  UI Elements
//
//  Created by ruslan on 16.08.2021.
//

import UIKit

class TabBarControllerVC: UITabBarController, TitleAndColorProvider {
    
    private let firstPage = PageVC(page: PageModel(emoji: "🚗", description: ""))
    private let secondPage = PageVC(page: PageModel(emoji: "🚌", description: ""))
    private let thirdPage = PageVC(page: PageModel(emoji: "🚋", description: ""))
    private let fourthPage = PageVC(page: PageModel(emoji: "✈️", description: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTabBarController()
    }
    
    required init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // changing colors
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .systemPurple
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.tintColor = .systemBlue
    }
    
    // MARK: - Tab bar controller configuring
    
    private func configureTabBarController() {
        
        viewControllers = [
            firstPage,
            secondPage,
            thirdPage,
            fourthPage
        ]
        
        // bar items
        
        let firstTabBarItem = UITabBarItem(title: "Car", image: UIImage(systemName: "car"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "Bus", image: UIImage(systemName: "bus")?.withAlignmentRectInsets(UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)), tag: 1)
        let thirdTabBarItem = UITabBarItem(title: "Tram", image: UIImage(systemName: "tram")?.withAlignmentRectInsets(UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)), tag: 2)
        let fourthTabBarItem = UITabBarItem(title: "Airplane", image: UIImage(systemName: "airplane"), tag: 3)
        
        firstPage.tabBarItem = firstTabBarItem
        secondPage.tabBarItem = secondTabBarItem
        thirdPage.tabBarItem = thirdTabBarItem
        fourthPage.tabBarItem = fourthTabBarItem
        
        // color
        tabBar.tintColor = .systemPurple
    }
}
