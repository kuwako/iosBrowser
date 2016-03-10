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
    // 戻るボタン
    @IBOutlet weak var backButton: UIBarButtonItem!
    // 進むボタン
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    // ロード中のグルグルボタン
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        
        // webView表示の方針
        // string -> NSURL -> NSURLRequest -> webView.loadRequest
        let startUrl = "http://dotinstall.com"
        
        // webview表示
        if let url = NSURL(string: startUrl) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        }
        self.setupButtonsEnabled()
        self.activityIndicator.hidesWhenStopped = true
    }
    
    func setupButtonsEnabled() {
        self.backButton.enabled = self.webView.canGoBack
        self.forwardButton.enabled = self.webView.canGoForward
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator.stopAnimating()
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

