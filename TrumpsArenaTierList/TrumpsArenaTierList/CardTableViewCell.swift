//
//  CardTableViewCell.swift
//  TrumpsArenaTierList
//
//  Created by 林东杰 on 3/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    // MARK: - Variable
    
    // MARK: - Properties
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
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