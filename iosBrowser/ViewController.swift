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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goBack(sender: AnyObject) {
    }

    @IBAction func goForward(sender: AnyObject) {
    }
    
    @IBAction func reload(sender: AnyObject) {
    }
}

