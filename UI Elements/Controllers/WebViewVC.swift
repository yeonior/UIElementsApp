//
//  WebViewVC.swift
//  UI Elements
//
//  Created by ruslan on 05.08.2021.
//

import UIKit
import WebKit

final class WebViewVC: UIViewController, WKNavigationDelegate {
    
    private var myWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        myWebView.allowsBackForwardNavigationGestures = true
        
        let refreshBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: myWebView, action: #selector(myWebView.reload))
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped(_:)))
        navigationItem.leftBarButtonItem = refreshBarButton
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
    
    @objc private func doneButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
