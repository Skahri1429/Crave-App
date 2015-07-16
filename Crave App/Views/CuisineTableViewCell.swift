//
//  CuisineTableViewCell.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/15/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit

class CuisineTableViewCell: UITableViewCell {

    @IBOutlet weak var cuisineLabel: UILabel! {
        didSet {
            if let lbl = cuisineLabelHolder {
                cuisineLabel.text = lbl
            }
        }
    }
    
    var cuisineLabelHolder: String! {
        didSet {
            if cuisineLabel != nil && cuisineLabelHolder != nil{
                cuisineLabel.text = cuisineLabelHolder
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
