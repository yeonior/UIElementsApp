//
//  MenuVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var labelButton: UIButton!
    @IBOutlet weak var buttonButton: UIButton!
    @IBOutlet weak var textViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        configuteButtons()
    }
    
    private func configuteButtons() {
        
        let buttons = [labelButton, buttonButton, textViewButton]
        
        for button in buttons {
            button?.layer.cornerRadius = 15
        }
    }
}
