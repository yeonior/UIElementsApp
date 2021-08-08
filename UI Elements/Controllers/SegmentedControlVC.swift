//
//  SegmentedControlVC.swift
//  UI Elements
//
//  Created by ruslan on 31.07.2021.
//

import UIKit

final class SegmentedControlVC: UIViewController {
    
    private var mySegmentedControl = UISegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UISegmentedControl"
        view.backgroundColor = .systemBackground
        cofigureSegmentedControl()
    }
    
    private func cofigureSegmentedControl() {
        
        let titleNamesArray = ["#1", "#2", "#3", "#4", "#5", "#6", "#7"]
        mySegmentedControl = UISegmentedControl(items: titleNamesArray)
        mySegmentedControl.selectedSegmentIndex = 0
        segmentedControlDidChange(mySegmentedControl)
        mySegmentedControl.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for: .valueChanged)
        
        view.addSubview(mySegmentedControl)
        
        mySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mySegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func segmentedControlDidChange(_ sender: UISegmentedControl) {
        
        guard sender == mySegmentedControl else { return }
        switch sender.selectedSegmentIndex {
        case 1:
            view.backgroundColor = .systemGray6
        case 2:
            view.backgroundColor = .systemGray5
        case 3:
            view.backgroundColor = .systemGray4
        case 4:
            view.backgroundColor = .systemGray3
        case 5:
            view.backgroundColor = .systemGray2
        case 6:
            view.backgroundColor = .systemGray
        default:
            view.backgroundColor = .systemBackground
        }
    }
}
