//
//  UIColor + Extensions.swift
//  UI Elements
//
//  Created by ruslan on 02.08.2021.
//

import UIKit

extension UIColor {
    
    // makes random color
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
