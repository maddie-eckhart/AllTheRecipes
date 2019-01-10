//
//  TableViewCell.swift
//  Recipes
//
//  Created by Eckhart, Madeline on 1/8/19.
//  Copyright © 2019 Eckhart, Madeline. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblHeadline: UILabel!
    @IBOutlet weak var lblTimeCook: UILabel!
    @IBOutlet weak var lblDishType: UILabel!
    
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
