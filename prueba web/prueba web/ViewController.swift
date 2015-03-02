//
//  ViewController.swift
//  prueba web
//
//  Created by Mohamed DIb on 2/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var url = NSURL(string: "http://192.168.0.105/lungo/prueba.html")

        var request = NSURLRequest(URL: url!)

        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

