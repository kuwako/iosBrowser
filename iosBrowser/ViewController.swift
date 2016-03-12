//
//  ViewController.swift
//  iosBrowser
//
//  Created by 桑古　昌輝 on 2016/03/10.
//  Copyright © 2016年 桑古　昌輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate {

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
        
        // ボーダーをつける
        let topBorder = CALayer()
        topBorder.frame = CGRectMake(0, 0, self.webView.frame.size.width, 1)
        topBorder.backgroundColor = UIColor.lightGrayColor().CGColor
        self.webView.layer.addSublayer(topBorder)
        
        self.webView.delegate = self
        self.textField.delegate = self
        
        // webView表示の方針
        // string -> NSURL -> NSURLRequest -> webView.loadRequest
        let startUrl = "http://dotinstall.com"
        
        self.jumpToUrl(startUrl)
        
        // webview表示
        self.setupButtonsEnabled()
        self.activityIndicator.hidesWhenStopped = true
    }
    
    func jumpToUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        } else {
            self.showAlert("Invalid URL")
        }
    }
    
    func showAlert(message: String) {
        // iOS8以上のみの処理
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        var urlString = self.textField.text
        urlString = urlString?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if urlString == "" {
            // alert
            self.showAlert("Please enter URL")
        } else {
            if !urlString!.hasPrefix("http://") && !urlString!.hasPrefix("https://"){
                urlString = "http://" + urlString!
            }
            // jumpToUrl
            self.jumpToUrl(urlString!)
            setupButtonsEnabled()
        }
        
        self.textField.resignFirstResponder()
        return true
    }
    
    func setupButtonsEnabled() {
        self.backButton.enabled = self.webView.canGoBack
        self.forwardButton.enabled = self.webView.canGoForward
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.webView.stopLoading()
        self.activityIndicator.stopAnimating()
        
        if error!.code != NSURLErrorCancelled {
            self.showAlert("Network Error")
        }
        
        self.updateUrlLocation()
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        self.activityIndicator.startAnimating()
    }
    
    func updateUrlLocation() {
        if let urlString = self.webView.request?.URL?.absoluteString {
            self.textField.text = urlString
        }
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator.stopAnimating()
        self.setupButtonsEnabled()
        
        if let urlString = self.webView.request?.URL?.absoluteString {
            self.textField.text = urlString
        }
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

