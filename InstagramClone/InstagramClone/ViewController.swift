//
//  ViewController.swift
//  InstagramClone
//
//  Created by Mohamed DIb on 26/2/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    /*
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    @IBOutlet var pickedImage: UIImageView!



    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {

        self.dismissViewControllerAnimated(true, completion: nil)

        pickedImage.image = image
    }


    @IBAction func pickImage(sender: AnyObject) {

        var image = UIImagePickerController()
        
        image.delegate = self

        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary

        self.presentViewController(image, animated: true, completion: nil)
    }


    @IBAction func buttonPause(sender: AnyObject) {

        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))

        activityIndicator.center = self.view.center

        activityIndicator.hidesWhenStopped = true

        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray

        view.addSubview(activityIndicator)

        activityIndicator.startAnimating()

        //UIApplication.sharedApplication().beginIgnoringInteractionEvents()

    }

    @IBAction func buttonRestore(sender: AnyObject) {

        activityIndicator.stopAnimating()

        //UIApplication.sharedApplication().endIgnoringInteractionEvents()

    }

    @IBAction func createAlert(sender: AnyObject) {

        var alert = UIAlertController(title: "Hey There", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)

        self.presentViewController(alert, animated: true, completion: nil)

    }

    */




    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Guarda Objetos usando la libreria PARSE

        /*
        var score = PFObject(className: "score")
        score.setObject("Pedro", forKey: "name")
        score.setObject(5859345345, forKey: "number")
        score.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in

            if success == true {
                println("Score created with ID: \(score.objectId)")
            }
        }
        */
        /*
        var query = PFQuery(className: "score")
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                println(objects)
                //for object in objects {
                    //NSLog("%@", objects)
                //}
            } else {
                println(error)
            }

        }
        */
        /*
        var query = PFQuery(className: "score")
        query.getObjectInBackgroundWithId("E4GhsCyj9W") {
            (score: PFObject!, error: NSError!) -> Void in

            if error == nil {

                //println(score.objectForKey("name") as NSString)
                score["name"] = "Daniel Iturriza"

                score["score"] = 777

                score.saveInBackground()

            } else {

                println(error)
            }
        }
        */

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

