//
//  ViewController.swift
//  iosBrowser
//
//  Created by 桑古　昌輝 on 2016/03/10.
//  Copyright © 2016年 桑古　昌輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        
        // string -> NSURL -> NSURLRequest -> webView.loadRequest
        let startUrl = "http://dotinstall.com"
        
        if let url = NSURL(string: startUrl) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        }
        self.setupButtonsEnabled()
    }
    
    func setupButtonsEnabled() {
        self.backButton.enabled = self.webView.canGoBack
        self.forwardButton.enabled = self.webView.canGoForward
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.setupButtonsEnabled()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goBack(sender: AnyObject) {
        self.webView.goBack()
    }

    @IBAction func goForward(sender: AnyObject) {
        self.webView.goForward()
    }
    
    @IBAction func reload(sender: AnyObject) {
        self.webView.reload()
    }
}

