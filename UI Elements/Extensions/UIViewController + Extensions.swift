//
//  UIViewController + Extensions.swift
//  UI Elements
//
//  Created by ruslan on 04.08.2021.
//

import UIKit

extension UIViewController {
    
    // status bar and navigation bar heights
    
    var statusBarHeight: CGFloat {
        return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
    }
    
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.height ?? 0.0
    }
}
