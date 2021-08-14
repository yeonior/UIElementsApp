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
    
    // title
    override var activityTitle: String? {
        return title
    }
    
    // image
    override var activityImage: UIImage? {
        return image
    }
    
    // name
    override var activityType: UIActivity.ActivityType? {
        return UIActivity.ActivityType("Custom activity")
    }
    
    // category
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    // checking objects before action performing
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    // preparing the service to perform action
    override func prepare(withActivityItems activityItems: [Any]) {
        return items = activityItems
    }
    
    // action performing
    override func perform() {
        action(self.items)
        activityDidFinish(true)
    }
}
