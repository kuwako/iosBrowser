//
//  ViewController.swift
//  iosBrowser
//
//  Created by 桑古　昌輝 on 2016/03/10.
//  Copyright © 2016年 桑古　昌輝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // string -> NSURL -> NSURLRequest -> webView.loadRequest
        let startUrl = "http://dotinstall.com"
        
        if let url = NSURL(string: startUrl) {
            let urlRequest = NSURLRequest(URL: url)
            self.webView.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goBack(sender: AnyObject) {
    }

    @IBAction func goForward(sender: AnyObject) {
    }
    
    @IBAction func reload(sender: AnyObject) {
    }
}

