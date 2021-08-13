//
//  PickerViewVC.swift
//  UI Elements
//
//  Created by ruslan on 27.07.2021.
//

import UIKit

final class PickerViewVC: UIViewController {
    
    private let myPickerView = UIPickerView()
    private lazy var rgb: (CGFloat, CGFloat, CGFloat) = (0.9, 0.8, 0.7) {
        didSet {
            view.backgroundColor = backgroundColor
        }
    }
    private var backgroundColor: UIColor {
        UIColor(red: rgb.0, green: rgb.1, blue: rgb.2, alpha: 1.0)
    }
//    var label1: UILabel = {
//        let label = UILabel()
//        label.text = ".9"
//        return label
//    }()
//    var label2: UILabel = {
//        let label = UILabel()
//        label.text = ".8"
//        return label
//    }()
//    var label3: UILabel = {
//        let label = UILabel()
//        label.text = ".7"
//        return label
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIPickerView"
        view.backgroundColor = backgroundColor
        view.addSubview(myPickerView)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        configurePickerView()
    }
    
    // MARK: - Picker view configuring
    
    private func configurePickerView() {
        
        // attributes
        myPickerView.selectRow(9, inComponent: 0, animated: true)
        myPickerView.selectRow(8, inComponent: 1, animated: true)
        myPickerView.selectRow(7, inComponent: 2, animated: true)
        myPickerView.layer.cornerRadius = 15
        
        // colors
        myPickerView.backgroundColor = .systemGray5
        
//        let dict = [0:label1, 1:label2, 2:label3]
//        myPickerView.setPickerLabels(labels: dict)
        
        // constraints
        myPickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myPickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myPickerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            myPickerView.heightAnchor.constraint(equalTo: myPickerView.widthAnchor)
        ])
    }
}

// MARK: - Picker view delegate and data source

extension PickerViewVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // data source
    
    // number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // number of rows in component
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 11
        
//        switch component {
//        case 0, 2, 4:
//            return 1
//        case 1, 3, 5:
//            return 11
//        default:
//            return 0
//        }
    }
    
    // delegate
    
    // title for each row in each component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if row == 10 {
            return "1"
        } else if row == 0 {
            return "0"
        } else {
            return ".\(row)"
        }

//        switch component {
//        case 0:
//            return "R:"
//        case 2:
//            return "G:"
//        case 4:
//            return "B:"
//        case 1, 3, 5:
//            if row == 10 {
//                return "1"
//            } else if row == 0 {
//                return "0"
//            } else {
//                return ".\(row)"
//            }
//        default:
//            return ""
//        }
    }
    
    // action after the user selects a row in a component
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        switch component {
        case 0:
            rgb.0 = CGFloat(row * 10) / 100
        case 1:
            rgb.1 = CGFloat(row * 10) / 100
        case 2:
            rgb.2 = CGFloat(row * 10) / 100
        default:
            break
        }
    }
}

//extension UIPickerView {
//
//    func setPickerLabels(labels: [Int:UILabel]) {
//
//        let fontSize: CGFloat = self.rowSize(forComponent: 1).height - 8
//        let labelWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfComponents)
//        let x: CGFloat = self.frame.origin.x
//        let y: CGFloat = self.frame.size.height / 2 + (fontSize * 1.2)
//
//        for i in 0...self.numberOfComponents {
//
//            if let label = labels[i] {
//
//                if self.subviews.contains(label) {
//                    label.removeFromSuperview()
//                }
//
//                label.frame = CGRect(x: labelWidth * CGFloat(i) + labelWidth * 0.1, y: y, width: labelWidth, height: fontSize)
//                label.font = UIFont.systemFont(ofSize: fontSize)
//                label.backgroundColor = .clear
//                label.textAlignment = .left
//
//                self.addSubview(label)
//            }
//        }
//    }
//}
