//
//  ViewController.swift
//  TestRokk3rLabs
//
//  Created by Mohamed DIb on 4/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

var listProducts: NSMutableArray = NSMutableArray()
var cartList = [Dictionary<String, AnyObject>]()

var countCar: Int = Int()

class ViewListController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var cartButton: UIBarButtonItem!

    @IBOutlet weak var tableView: UITableView!

    func quantityCart () -> Void {

        // Agregar contador al carrito
        var cantidad: String = String(cartList.count)
        cantidad = "Cart(\(cantidad))"
        cartButton.title = cantidad

    }

    func addCartList(sender: UIButton) {

        var flag = 0

        let point = tableView.convertPoint(CGPointZero, fromView: sender)

        let arraySize = cartList.count

        if let indexPath = tableView.indexPathForRowAtPoint(point) {

            //if listProducts[indexPath.row]["stock"]
            
            if arraySize > 0 {

                //recorro el carrito
                for var i = 0; i < arraySize; i++ {

                    var cart: String = cartList[i]["sku"] as String
                    var list: String = listProducts[indexPath.row]["sku"] as String

                    if cart != list {

                        flag = 1

                    } else {

                        var count: String = cartList[i]["stock"] as String!

                        var suma: String = String(count.toInt()! + 1)

                        cartList[i]["stock"] = suma
                        
                        //flag = 0 
                    }
                }

                if flag == 1 {

                    var product = ["name": "","stock": "0", "sku": "", "price": ""]

                    product["name"] = listProducts[indexPath.row]["name"] as? String
                    product["sku"] = listProducts[indexPath.row]["sku"] as? String
                    product["price"] = listProducts[indexPath.row]["price"] as? String
                    product["stock"] = "1"
                    
                    cartList.append(product)
                }


            } else {

                var product = ["name": "","stock": "0", "sku": "", "price": ""]

                product["name"] = listProducts[indexPath.row]["name"] as? String
                product["sku"] = listProducts[indexPath.row]["sku"] as? String
                product["price"] = listProducts[indexPath.row]["price"] as? String
                product["stock"] = "1"

                cartList.append(product)

            }

            var aux : String = listProducts[indexPath.row]["stock"] as String

            var stock: String = String(aux.toInt()! - 1)

            listProducts[indexPath.row].setObject(stock, forKey: "stock")

            println(listProducts[indexPath.row]["stock"]!)

            if stock.toInt()! == 0 {
                auxCartList = cartList
                listProducts.removeObjectAtIndex(indexPath.row)
                tableView.reloadData()
            }

        }
        tableView.reloadData()


        println(cartList)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Here, I pull data of DummyDataList.plist
        var List: NSString = NSBundle.mainBundle().pathForResource("dummyDataList", ofType: "plist")!
        listProducts = NSMutableArray(contentsOfFile: List)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell: taskViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as taskViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None

        var num: String = listProducts[indexPath.row]["stock"] as String
        var numStock: Int = num.toInt()! - 1

        if numStock > 0 {
            cell.titleTask.text = listProducts[indexPath.row]["name"] as? String

            let sku = listProducts[indexPath.row]["sku"] as? String
            let stock = listProducts[indexPath.row]["stock"] as? String
            let price = listProducts[indexPath.row]["price"] as? String

            cell.skuTask.text = "SKU: \(sku!)"
            cell.stockTask.text = "Stock: \(stock!)"
            cell.priceTask.text = "Price: $\(price!)"

            cell.buyButton.addTarget(self, action: Selector("addCartList:"), forControlEvents: .TouchUpInside)

        }

        return cell
    }

    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
    }


}
