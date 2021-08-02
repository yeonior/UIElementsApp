//
//  UIColor + Extension.swift
//  UI Elements
//
//  Created by ruslan on 02.08.2021.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 0.4)
    }
}
