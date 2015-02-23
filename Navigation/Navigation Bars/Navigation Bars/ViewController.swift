//
//  ViewController.swift
//  Navigation Bars
//
//  Created by Office-UpperSky-Hackintosh on 2/19/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var count = 0
    func updateTime (){
        count++
        labelTimer.text = "\(count)"
    }

    @IBOutlet var labelTimer: UILabel!
    
    @IBAction func pause(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        count = 0
        labelTimer.text = "\(count)"
    }
    
    @IBAction func play(sender: AnyObject) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

