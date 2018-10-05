//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by Mario Rendon on 2018-10-05.
//  Copyright © 2018 Mario Rendon Zapata. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    // Mark: properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
