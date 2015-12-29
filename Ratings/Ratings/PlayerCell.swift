//
//  PlayerCell.swift
//  Ratings
//
//  Created by 林东杰 on 12/29/15.
//  Copyright © 2015 Joey. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
    // MARK: - Variable
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    // MARK: - Properties
    var player: Player! {
        didSet {
            gameLabel.text = player.game
            nameLabel.text = player.name
            ratingImageView.image = imageForRating(player.rating)
        }
    }
    
    // MARK: - Life Cycle
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - TableView Datasource
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func imageForRating(rating: Int) ->UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
}
