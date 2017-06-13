//
//  ViewController.swift
//  Firebase
//
//  Created by Brendon Warwick on 13/06/2017.
//  Copyright © 2017 Brendon Warwick. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKNavigationDelegate{
    
    // MARK; Attributes
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: NSButton!
    @IBOutlet weak var headerBox: NSBox!
    
    // MARK: Init
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Sets up the web view to be displayed correctly
        setUpView()
        
        // Load the login page. 
        goToFirebase()
    }
    
    func setUpView(){
        let configuration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        view.addSubview(webView)
    }
    
    // MARK: Navigation
    
    func goToFirebase(){
        // At this point the delegate will have fetched cookies so auto-login will work.
        if let url = URL(string: "https://www.google.com/accounts/ServiceLogin?passive=true&continue=https%3A%2F%2Ffirebase.google.com%2F%3Frefresh%3D1&service=ahsid") {
            webView.load(URLRequest(url: url))
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        webView.goBack()
    }
}

