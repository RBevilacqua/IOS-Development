//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Mohamed DIb on 24/2/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "http://192.168.0.102:1337/course")

        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in

            if error == nil {

                var urlContent:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

                var dersler : NSArray = urlContent.valueForKey("courses") as NSArray

                println(dersler.count)

                println(dersler[1]["title"])

                //var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)

                //println(urlContent)

                /*dispatch_async(dispatch_get_main_queue()) {
                    self.webView.loadHTMLString(urlContent, baseURL: nil)*/

            }


        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
//let session = NSURLSession(configuration: configuration)
/*let dataTask = session.dataTaskWithURL(NSURL(string: "http://httpbin.org/get"), completionHandler: {(data, urlResponse, error) in
    println(NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil))
})
dataTask.resume()*/

