//
//  WebViewVC.swift
//  UI Elements
//
//  Created by ruslan on 05.08.2021.
//

import UIKit
import WebKit

class WebViewVC: UIViewController, WKNavigationDelegate {
    
    var myWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "yandex.ru"
        configureWebView()
        
        if let url = URL(string: "https://yandex.ru") {
            let urlRequest = URLRequest(url: url)
            myWebView.load(urlRequest)
        }
    }
    
    private func configureWebView() {
        
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        myWebView = WKWebView(frame: view.bounds, configuration: configuration)
        myWebView.backgroundColor = .systemBackground
        myWebView.navigationDelegate = self
        
        let backImage = UIImage(systemName: "arrow.backward")
        let forwardImage = UIImage(systemName: "arrow.forward")
        let backBarButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(goBack(_:)))
        let forwardBarButton = UIBarButtonItem(image: forwardImage, style: .plain, target: self, action: #selector(goForward(_:)))
        let refreshBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshPage(_:)))
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped(_:)))
        navigationItem.leftBarButtonItems = [backBarButton, forwardBarButton]
        navigationItem.leftBarButtonItems?.forEach({ button in
            button.isEnabled = false
        })
        navigationItem.leftBarButtonItems?.append(refreshBarButton)
        navigationItem.rightBarButtonItem = doneBarButton
        
        view.addSubview(myWebView)
        
        myWebView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myWebView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            myWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    @objc private func goBack(_ sender: UIBarButtonItem) {
        guard let leftBarButtonItems = navigationItem.leftBarButtonItems, sender == leftBarButtonItems[0] else { return }
        
        if myWebView.canGoBack {
            myWebView.goBack()
        }
    }
    
    @objc private func goForward(_ sender: UIBarButtonItem) {
        guard let leftBarButtonItems = navigationItem.leftBarButtonItems, sender == leftBarButtonItems[1] else { return }
        
        if myWebView.canGoForward {
            myWebView.goForward()
        }
    }
    
    @objc private func refreshPage(_ sender: UIBarButtonItem) {
        guard let leftBarButtonItems = navigationItem.leftBarButtonItems, sender == leftBarButtonItems[2] else { return }
        myWebView.reload()
    }
    
    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        guard sender == navigationItem.rightBarButtonItem else { return }
        dismiss(animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        guard let leftBatButtonItems = navigationItem.leftBarButtonItems else { return }
        leftBatButtonItems[0].isEnabled = false
        leftBatButtonItems[1].isEnabled = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let leftBatButtonItems = navigationItem.leftBarButtonItems else { return }
        if webView.canGoBack {
            leftBatButtonItems[0].isEnabled = true
        } else if webView.canGoForward {
            leftBatButtonItems[1].isEnabled = true
        }
    }
}
