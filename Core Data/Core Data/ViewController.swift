//
//  ViewController.swift
//  Core Data
//
//  Created by Mohamed DIb on 25/2/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate

        var context:NSManagedObjectContext = appDel.managedObjectContext!

//        var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
//
//        newUser.setValue("Rob", forKey: "username")
//        newUser.setValue("hola", forKey: "password")
//
//        context.save(nil)

        var request = NSFetchRequest(entityName: "Users")

        request.returnsObjectsAsFaults = false

        /* ----- Realiza un select para buscar el dato desde el "username" ----- */
        request.predicate = NSPredicate(format: "username = %@", "Rob")

        var result = context.executeFetchRequest(request, error: nil)

        if result?.count > 0 {

            //println(result)

            for result: AnyObject in result! {

                if let user = result.valueForKey("username") as? String {

                    if user == "Rob" {

//                        context.deleteObject(result as NSManagedObject)
//
//                        println(user + " has been deleted")

                        result.setValue("pass56", forKey: "password")
                    }
                }
                context.save(nil)
                println(result)
            }

        } else {
            println("No results")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

