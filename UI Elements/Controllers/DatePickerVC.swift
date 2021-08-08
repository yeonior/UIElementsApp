//
//  DatePickerVC.swift
//  UI Elements
//
//  Created by ruslan on 30.07.2021.
//

import UIKit

final class DatePickerVC: UIViewController {
    
    private let myDatePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UIDatePicker"
        view.backgroundColor = .systemBackground
        configureDatePicker()
    }
    
    private func configureDatePicker() {
        
        myDatePicker.datePickerMode = .date
        myDatePicker.preferredDatePickerStyle = .wheels
        
        let locale = Locale.preferredLanguages.first
        myDatePicker.locale = Locale(identifier: locale!)
        
        let currentDate = Calendar.current.date(byAdding: .month, value: 0, to: Date())
        let oneMonthAhead = Calendar.current.date(byAdding: .month, value: 1, to: Date())
        myDatePicker.minimumDate = currentDate
        myDatePicker.maximumDate = oneMonthAhead
        
        myDatePicker.backgroundColor = .systemGray5
        myDatePicker.clipsToBounds = true
        myDatePicker.layer.cornerRadius = 15
        
        view.addSubview(myDatePicker)
        
        myDatePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myDatePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myDatePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
