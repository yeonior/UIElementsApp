//
//  ActivityIndicatorViewVC.swift
//  UI Elements
//
//  Created by ruslan on 26.08.2021.
//

import UIKit

class ActivityIndicatorViewVC: UIViewController, TitleAndColorProvider {
    
    private let myActivityIndicator = UIActivityIndicatorView()
    private let myLabel = UILabel()
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(myLabel)
        view.addSubview(myActivityIndicator)
        configureLabel()
        configureActivityIndicator()
    }
    
    required init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabel() {
        
        // size and location
        let labelSide = view.bounds.width * 0.5
        myLabel.frame = CGRect(x: 0, y: 0, width: labelSide, height: labelSide)
        myLabel.center = view.center
        
        // attributes
        myLabel.text = "Fake data is fully loaded"
        myLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        myLabel.textAlignment = .center
        myLabel.numberOfLines = 0
        myLabel.lineBreakMode = .byWordWrapping
        myLabel.clipsToBounds = true
        myLabel.layer.cornerRadius = 15
        myLabel.isHidden = true
        
        // colors
        myLabel.backgroundColor = .systemGray5
    }
    
    private func configureActivityIndicator() {
        
        // size and location
        let indicatorSide = view.bounds.width * 0.5
        myActivityIndicator.frame = CGRect(x: 0, y: 0, width: indicatorSide, height: indicatorSide)
        myActivityIndicator.center = view.center
        myActivityIndicator.style = .large
        
        // animating
        myActivityIndicator.startAnimating()
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { [unowned self] timer in
            self.myActivityIndicator.stopAnimating()
            self.myLabel.isHidden = false
            timer.invalidate()
        })
    }
}
