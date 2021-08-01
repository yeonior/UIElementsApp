//
//  MenuVC.swift
//  UI Elements
//
//  Created by ruslan on 26.07.2021.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var viewButton: UIButton!
    @IBOutlet weak var labelButton: UIButton!
    @IBOutlet weak var buttonButton: UIButton!
    @IBOutlet weak var imageViewButton: UIButton!
    @IBOutlet weak var textViewButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var sliderButton: UIButton!
    @IBOutlet weak var pickerViewButton: UIButton!
    @IBOutlet weak var datePickerButton: UIButton!
    @IBOutlet weak var segmentedControlButton: UIButton!
    @IBOutlet weak var alertControllerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Menu"
        configureButtons()
    }
    
    private func configureButtons() {
        
        let buttons = [
            viewButton,
            labelButton,
            buttonButton,
            imageViewButton,
            textViewButton,
            switchButton,
            sliderButton,
            pickerViewButton,
            datePickerButton,
            segmentedControlButton,
            alertControllerButton
        ]
        
        for button in buttons {
            button?.layer.cornerRadius = 15
        }
    }
}
