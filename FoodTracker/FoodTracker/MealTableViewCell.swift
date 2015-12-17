//
//  MealTableViewCell.swift
//  FoodTracker
//
//  Created by 林东杰 on 12/17/15.
//
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // MARK: - Variable
    
    // MARK: - Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - TableView Datasource
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    
    // MARK: - Getters/Setters
    
    



}
