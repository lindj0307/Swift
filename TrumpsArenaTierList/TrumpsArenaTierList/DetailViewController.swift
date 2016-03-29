//
//  DetailViewController.swift
//  TrumpsArenaTierList
//
//  Created by 林东杰 on 3/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var describeText: UITextView!
    
    var detailCard: Card? {
        didSet {
            configureView()
        }
    }
    
    func configureView() {
        if let detailCandy = detailCard {
            if let  describeText = describeText, cardImageView = cardImageView {
                describeText.text = detailCandy.name
                cardImageView.image = UIImage(named: detailCandy.name)
                title = detailCandy.category
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
