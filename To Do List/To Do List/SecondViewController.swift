//
//  SecondViewController.swift
//  To Do List
//
//  Created by Mohamed DIb on 23/2/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var item: UITextField!

    @IBAction func addUten(sender: AnyObject) {

        toDoList.append(item.text)

        item.text = ""

        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

