//
//  Meal.swift
//  FoodTracker
//
//  Created by Mario Rendon on 2018-10-01.
//  Copyright © 2018 Mario Rendon Zapata. All rights reserved.
//

import UIKit

class Meal {
    // Mark: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // Mark: Initialization
    init? (name: String, photo: UIImage?, rating: Int) {
        
        // guard statements declares a condition that must be true in order for the code to execute the code after the guard statement

        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        // Initalize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
