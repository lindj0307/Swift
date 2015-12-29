//
//  Player.swift
//  Ratings
//
//  Created by 林东杰 on 12/29/15.
//  Copyright © 2015 Joey. All rights reserved.
//

import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String?, rating: Int) {
        self.name = name
        self.game = game
        self.rating = rating
    }
}
