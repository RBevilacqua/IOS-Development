//
//  ViewCartController.swift
//  TestRokk3rLabs
//
//  Created by Mohamed DIb on 4/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

var auxCartList = [Dictionary<String, AnyObject>]()

protocol writeValueBackDelegate {
    func writeValueBack(value: [Dictionary<String, AnyObject>])
}

class ViewCartController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!

    var buyCart = [Dictionary<String, AnyObject>]()
    var delegate: writeValueBackDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task: CartViewCell = tableView.dequeueReusableCellWithIdentifier("Item") as CartViewCell

        let quantity = cartList[indexPath.row]["stock"] as? String

        task.cartTitle.text = cartList[indexPath.row]["name"] as? String
        task.cartQuantity.text = "Quantity: \(quantity!)"

        return task
    }

    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == UITableViewCellEditingStyle.Delete {

            var aux : String = cartList[indexPath.row]["stock"] as String

            var stock: String = String(aux.toInt()! - 1)

            cartList[indexPath.row]["stock"] = stock

            aux = listProducts[(cartList[indexPath.row]["index"] as String).toInt()!]["stock"] as String

            let numListProduct = (cartList[indexPath.row]["index"] as String).toInt()!
            

            if listProducts[numListProduct]["sku"] as String == cartList[indexPath.row]["sku"] as String {

                println(numListProduct)

                listProducts[numListProduct].setObject(String(aux.toInt()! + 1), forKey: "stock")

            }

            if stock.toInt()! == 0 {

                if listProducts[numListProduct]["sku"] as String != cartList[indexPath.row]["sku"] as String {

                    listProducts.addObject(auxCartList[indexPath.row])

                }

                //listProducts.insertObject(auxCartList[indexPath.row], atIndex: 0)
                delegate?.writeValueBack(buyCart)

                cartList.removeAtIndex(indexPath.row)

            }

            listTable.reloadData()
        }
    }

    /* Share and Delete */
    /*
    func tableView(tableView: UITableView!, editActionsForRowAtIndexPath indexPath: NSIndexPath!) -> [AnyObject]! {

        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Share", handler: {
            (action: UITableViewRowAction!, indexPath: NSIndexPath!) in
            println("Triggered share action \(action) atIndexPath: \(indexPath.row)")
            return
        })

        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {
            (action: UITableViewRowAction!, indexPath: NSIndexPath!) in
            println("Triggered delete action \(action) atIndexPath: \(indexPath.row)")
            return
        })

        return [deleteAction, shareAction]
    }
    */

    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }
    

}

