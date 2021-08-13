//
//  WebViewVC.swift
//  UI Elements
//
//  Created by ruslan on 05.08.2021.
//

import UIKit
import WebKit

final class WebViewVC: UIViewController {
    
    private var myWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureWebView()
        myWebView.navigationDelegate = self
        loadWebContent(from: "httpss://yandex.ru")
    }
    
    // MARK: - Web view configuring
    
    private func configureWebView() {
        
        // preferences and configuration
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        
        // attrubutes
        myWebView = WKWebView(frame: view.bounds, configuration: configuration)
        myWebView.allowsBackForwardNavigationGestures = true
        
        // color
        myWebView.backgroundColor = .systemBackground
        
        // bar buttons
        let refreshBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: myWebView, action: #selector(myWebView.reload))
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidTouchUpInside))
        navigationItem.leftBarButtonItem = refreshBarButton
        navigationItem.rightBarButtonItem = doneBarButton
        
        // adding
        view.addSubview(myWebView)
        
        // constraints
        myWebView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            myWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            myWebView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            myWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    // dismissing the web view
    @objc private func doneButtonDidTouchUpInside() {
        dismiss(animated: true, completion: nil)
    }
    
    // loading web content from specify URL
    private func loadWebContent(from URLString: String) {
        guard let url = URL(string: URLString) else { return }
        let urlRequest = URLRequest(url: url)
        myWebView.load(urlRequest)
    }
}

// MARK: - Web view navigation delegate

extension WebViewVC: WKNavigationDelegate {
    
    // action after page is fully loaded
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
