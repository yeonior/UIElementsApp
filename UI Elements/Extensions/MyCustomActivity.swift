//
//  MyCustomActivity.swift
//  UI Elements
//
//  Created by ruslan on 02.08.2021.
//

import UIKit

class MyCustomActivity: UIActivity {
    
    var title: String
    var image: UIImage?
    var action: ([Any]) -> ()
    var items = [Any]()
    
    init(title: String,
         image: UIImage?,
         action: @escaping ([Any]) -> ()) {
        
        self.title = title
        self.image = image
        self.action = action
    }
    
    override var activityTitle: String? {
        return title
    }
    
    override var activityImage: UIImage? {
        return image
    }
    
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("Custom activity")
    }
    
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        return items = activityItems
    }
    
    override func perform() {
        action(self.items)
        activityDidFinish(true)
    }
}
