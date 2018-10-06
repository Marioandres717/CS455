//
//  Meal.swift
//  FoodTracker
//
//  Created by Mario Rendon on 2018-10-01.
//  Copyright © 2018 Mario Rendon Zapata. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    // Mark: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // Mark: Archiving paths
    
    static let DocumentsDir = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDir.appendingPathComponent("meals")
    // Mark: Types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
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
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        // Key value pair storage
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decoded a name string, the initializer should fail
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("unable to decode the name for a meal object", log: OSLog.default, type: .debug)
        return nil
        }
        // Because photo is an optional property of Meal, just use conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer
        self.init(name: name, photo: photo, rating: rating)
    }
}
