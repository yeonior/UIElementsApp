//
//  PageViewControllerVC.swift
//  UI Elements
//
//  Created by ruslan on 09.08.2021.
//

import UIKit

final class PageViewControllerVC: UIPageViewController {
    
    var pages = [PageHelper]()
    lazy var pageViewControllers: [PageVC] = {
        var viewControllers = [PageVC]()
        for page in pages {
            viewControllers.append(PageVC(page: page))
        }
        return viewControllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePages()
        configurePageVCIndicator()
    }
    
        override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: navigationOrientation,
                   options: nil)
        
        title = "UIPageViewController"
        view.backgroundColor = .systemBackground
        setViewControllers([pageViewControllers[0]], direction: .forward, animated: true, completion: nil)
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configurePages() {
        
        let firstPage = PageHelper(emoji: "👋", description: "Hello there! \n \nHere you can learn a little bit about PageViewController! \n \nSwipe left to go to the next page.")
        let secondPage = PageHelper(emoji: "📥 + 📄", description: "PageViewController is a container view controller that manages navigation between pages of content, where a child view controller manages each page.")
        let thirdPage = PageHelper(emoji: "⬇", description: "Look at the page indicator down here! \n \nIt is a control that displays a horizontal series of dots, each of which corresponds to a page in the app’s document or other data-model entity.")
        let fourthPage = PageHelper(emoji: "👍", description: "All right, that's it! \n \nIt was a quick review about PageViewController. \n \nSee you later!")
        pages = [firstPage, secondPage, thirdPage, fourthPage]
    }
    
    private func configurePageVCIndicator() {
        let indicatorAppearance = UIPageControl.appearance()
        indicatorAppearance.currentPageIndicatorTintColor = .label
        indicatorAppearance.pageIndicatorTintColor = .gray.withAlphaComponent(0.5)
        indicatorAppearance.backgroundColor = .clear
    }
}

extension PageViewControllerVC: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? PageVC else { return nil }
        if let index = pageViewControllers.firstIndex(of: vc) {
            if index > 0 {
                return pageViewControllers[index - 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vc = viewController as? PageVC else { return nil }
        if let index = pageViewControllers.firstIndex(of: vc) {
            if index < pageViewControllers.count - 1 {
                return pageViewControllers[index + 1]
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pageViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
}
