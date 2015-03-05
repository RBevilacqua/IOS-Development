//
//  ViewCartController.swift
//  TestRokk3rLabs
//
//  Created by Mohamed DIb on 4/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

var auxCartList = [Dictionary<String, AnyObject>]()

class ViewCartController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
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

            aux = listProducts[indexPath.row]["stock"] as String

            listProducts[indexPath.row].setObject(String(aux.toInt()! + 1), forKey: "stock")

            if stock.toInt()! == 0 {

                listProducts.addObject(auxCartList[indexPath.row])

                cartList.removeAtIndex(indexPath.row)

            }

            listTable.reloadData()
        }
    }

    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }
    

}

