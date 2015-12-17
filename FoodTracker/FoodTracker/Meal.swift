//
//  Meal.swift
//  FoodTracker
//
//  Created by 林东杰 on 12/16/15.
//
//

import UIKit


class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}
