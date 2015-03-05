//
//  taskViewCell.swift
//  TestRokk3rLabs
//
//  Created by Mohamed DIb on 4/3/15.
//  Copyright (c) 2015 UpperSky. All rights reserved.
//

import UIKit

class taskViewCell: UITableViewCell {

    @IBOutlet weak var titleTask: UILabel!
    @IBOutlet weak var skuTask: UILabel!
    @IBOutlet weak var stockTask: UILabel!
    @IBOutlet weak var priceTask: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
