//
//  ViewController.swift
//  Webviews
//
//  Created by Mohamed DIb on 25/2/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var url = NSURL(string: "http://cursos.lccopentech.com.ve/#/")

        var request = NSURLRequest(URL: url!)

        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

