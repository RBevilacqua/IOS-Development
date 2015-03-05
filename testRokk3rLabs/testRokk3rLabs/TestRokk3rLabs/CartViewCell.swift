//
//  CartViewCell.swift
//  TestRokk3rLabs
//
//  Created by Mohamed DIb on 5/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class CartViewCell: UITableViewCell {

    @IBOutlet weak var cartTitle: UILabel!
    @IBOutlet weak var cartQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
