//
//  SliderVC.swift
//  UI Elements
//
//  Created by ruslan on 27.07.2021.
//

import UIKit

class SliderVC: UIViewController {
    
    let mySlider = UISlider()
    let firstView = UIView()
    let secondView = UIView()
    var firstViewAlpha: CGFloat = 1.0 {
        didSet {
            firstView.alpha = firstViewAlpha
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureViews()
        configureSlider()
    }
    
    private func configureViews() {
        
        view.backgroundColor = .black
        firstView.backgroundColor = .white
        secondView.backgroundColor = .clear
        
        firstView.alpha = firstViewAlpha
        
        view.addSubview(firstView)
        view.addSubview(secondView)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstView.topAnchor.constraint(equalTo: view.topAnchor),
            firstView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            secondView.topAnchor.constraint(equalTo: firstView.topAnchor),
            secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor)
        ])
    }
    
    private func configureSlider() {
        
        mySlider.minimumValue = 0.0
        mySlider.maximumValue = 1.0
        mySlider.value = Float(firstViewAlpha)
        
        mySlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        
        secondView.addSubview(mySlider)
        
        mySlider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mySlider.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            mySlider.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            mySlider.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func sliderValueDidChange(_ sender: UISlider) {
        guard sender == mySlider else { return }
        firstViewAlpha = CGFloat(mySlider.value)
    }
}
