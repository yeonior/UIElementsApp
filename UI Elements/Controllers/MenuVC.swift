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
    @IBOutlet weak var imageViewButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        configuteButtons()
    }
    
    private func configuteButtons() {
        
        let buttons = [
            labelButton,
            buttonButton,
            textViewButton,
            imageViewButton,
            switchButton
        ]
        
        for button in buttons {
            button?.layer.cornerRadius = 15
        }
    }
}
