//
//  ActivityViewControllerVC.swift
//  UI Elements
//
//  Created by ruslan on 02.08.2021.
//

import UIKit

final class ActivityViewControllerVC: UIViewController, TitleAndColorProvider {
    
    private let shareButton = UIButton()
    private var myActivityViewController: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(shareButton)
        configureButton()
    }
    
    init(title: String, backgroundColor: UIColor) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self.view.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button configuring
    
    private func configureButton() {
        
        // attributes
        let image = UIImage(systemName: "square.and.arrow.up")
        shareButton.setImage(image, for: .normal)
        shareButton.imageView?.contentMode = .scaleAspectFit
        shareButton.contentVerticalAlignment = .fill
        shareButton.contentHorizontalAlignment = .fill
//        shareButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // color
        shareButton.backgroundColor = .clear
        
        // action
        shareButton.addTarget(self, action: #selector(buttonDidTouchUpInside(_:)), for: .touchUpInside)
        
        // constraints
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            shareButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
            shareButton.heightAnchor.constraint(equalTo: shareButton.widthAnchor)
        ])
    }
    
    // activity view controller creation
    @objc private func buttonDidTouchUpInside(_ sender: UIButton) {
        guard sender == shareButton else { return }
        
        // MARK: Activity view controller configuring
        
        // custom activity
        let activity = MyCustomActivity(title: "Change background color",
                                        image: UIImage(systemName: "wand.and.stars.inverse")) { [unowned self] _ in
            
            self.view.backgroundColor = UIColor.random
        }
        myActivityViewController = UIActivityViewController(activityItems: ["Something"],
                                                            applicationActivities: [activity])
        myActivityViewController?.excludedActivityTypes = [.postToFacebook, .postToWeibo]
        
        if let activityVC = myActivityViewController {
            present(activityVC, animated: true)
        }
    }
}
