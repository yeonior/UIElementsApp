//
//  UIApplication + Extension.swift
//  UI Elements
//
//  Created by ruslan on 03.08.2021.
//

import UIKit

extension UIViewController {
    
    var statusBarHeight: CGFloat {
        return view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    }
    
    var navigationBarHeight: CGFloat {
        return navigationController?.navigationBar.frame.height ?? 0.0
    }
}
