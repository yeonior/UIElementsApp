//
//  UIScrollView + Extensions.swift
//  UI Elements
//
//  Created by ruslan on 08.08.2021.
//

import UIKit

extension UIScrollView {
    
    // scrolling to bottom
    func scrollsToBottom(animated: Bool) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.height + safeAreaInsets.bottom)
        setContentOffset(bottomOffset, animated: animated)
    }
}
