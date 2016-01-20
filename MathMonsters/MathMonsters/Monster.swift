//
//  Monster.swift
//  MathMonsters
//
//  Created by 林东杰 on 1/19/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

enum Weapon {
    case Blowgun,NinjaStar,Fire,Sword,Smoke
}

class Monster {
    let name: String
    let description: String
    let iconName: String
    let weapon: Weapon
    
    init(name:String,description:String,iconName:String,weapon:Weapon) {
        self.name = name
        self.description = description
        self.iconName = iconName
        self.weapon = weapon
    }
    
    func weaponImage() -> UIImage? {
        switch self.weapon {
        case .Blowgun:
            return UIImage(named: "blowgun")
        case .Fire:
            return UIImage(named: "fire")
        case .NinjaStar:
            return UIImage(named: "ninjastar")
        case .Smoke:
            return UIImage(named: "smoke")
        case .Sword:
            return UIImage(named: "sword")
            
        }
    }
}