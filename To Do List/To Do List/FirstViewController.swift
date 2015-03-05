//
//  FirstViewController.swift
//  To Do List
//
//  Created by Mohamed DIb on 23/2/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

var toDoList:[String] = []

var chapters: NSArray = NSArray()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var ToDoListTable: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        var Chapterpath:NSString = NSBundle.mainBundle().pathForResource("pplist", ofType: "plist")!

        chapters = NSArray(contentsOfFile: Chapterpath)!

        /*if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {

            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as [String]
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")

        cell.textLabel?.text = chapters[indexPath.row]["Titulo"] as? String


        return cell
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == UITableViewCellEditingStyle.Delete {

            toDoList.removeAtIndex(indexPath.row)

            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")

            ToDoListTable.reloadData()
        }
    }


    override func viewDidAppear(animated: Bool) {
        //ToDoListTable.reloadData()
    }



}
