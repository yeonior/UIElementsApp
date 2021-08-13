//
//  SliderVC.swift
//  UI Elements
//
//  Created by ruslan on 27.07.2021.
//

import UIKit

final class SliderVC: UIViewController {
    
    private let mySlider = UISlider()
    private let firstView = UIView()
    private let secondView = UIView()
    private var firstViewAlpha: CGFloat = 1.0 {
        didSet {
            firstView.alpha = firstViewAlpha
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UISlider"
        view.addSubview(firstView)
        view.addSubview(secondView)
        secondView.addSubview(mySlider)
        configureViews()
        configureSlider()
    }
    
    // MARK: Views configuring
    
    private func configureViews() {
        
        // colors
        view.backgroundColor = .black
        firstView.backgroundColor = .white
        firstView.alpha = firstViewAlpha
        secondView.backgroundColor = .clear
        
        // constraints
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.topAnchor.constraint(equalTo: view.topAnchor),
            firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor),
            secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor)
        ])
    }
    
    // MARK: - Slider configuring
    
    private func configureSlider() {
        
        // attributes
        mySlider.minimumValue = 0.0
        mySlider.maximumValue = 1.0
        mySlider.value = Float(firstViewAlpha)
        
        // adding action
        mySlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        
        // constraints
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mySlider.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            mySlider.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            mySlider.widthAnchor.constraint(equalTo: secondView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    // slider action
    @objc private func sliderValueDidChange(_ sender: UISlider) {
        guard sender == mySlider else { return }
        firstViewAlpha = CGFloat(mySlider.value)
    }
}
