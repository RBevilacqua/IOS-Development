//
//  ViewController.swift
//  taskPrueba
//
//  Created by Mohamed DIb on 3/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

var chapters: NSArray = NSArray()

var suma = 0


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func buyButtonPlus(sender: UIButton) {
        suma += 1
        println(suma)

        /*
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as NSString
        let path = documentsDirectory.stringByAppendingPathComponent("pplist.plist")

        var data = "hola"
        chapters[1].setObject(data, forKey: "Sub")
        //var name = chapters[1]["Sub"].mutableCopy() as NSMutableArray
        //names = tempNames.mutableCopy() as NSMutableArray

        var dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
        //saving values
        dict.setObject(chapters, forKey: "Sub")

        //writing to GameData.plist
        dict.writeToFile(path, atomically: false)

        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("Saved GameData.plist file is --> \(resultDictionary?.description)")
    */
    }


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var Chapterpath:NSString = NSBundle.mainBundle().pathForResource("pplist", ofType: "plist")!

        chapters = NSArray(contentsOfFile: Chapterpath)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("Cell") as TaskCell

        cell.titleLabel.text = chapters[indexPath.row]["Titulo"] as? String
        cell.descriptionLabel.text = chapters[indexPath.row]["Sub"] as? String

        cell.buyButton.tag = indexPath.row

        cell.buyButton.addTarget(self, action: "buyButtonPlus:", forControlEvents: .TouchUpInside)

        /*cell.button.tag = indexPath.row;
        cell.button.addTarget(self, action: "followButton:", forControlEvents: .TouchUpInside)*/

        
        
        return cell
    }

    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }


}

