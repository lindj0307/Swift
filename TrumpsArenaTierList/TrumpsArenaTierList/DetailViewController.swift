//
//  DetailViewController.swift
//  TrumpsArenaTierList
//
//  Created by 林东杰 on 3/24/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var firstText: UITextView!
    @IBOutlet weak var secondText: UITextView!
    @IBOutlet weak var thirdText: UITextView!
    
    var firstCard: Card? {
        didSet {
            configureFirstCard()
        }
    }
    var secondCard: Card? {
        didSet {
            configureSecondCard()
        }
    }
    var thirdCard: Card? {
        didSet {
            configureThirdCard()
        }
    }
    
    func configureFirstCard() {
        if let firstCard = firstCard {
            if let  describeText = firstText, cardImageView = firstImageView {
                describeText.text = "\(firstCard.rating) \n\(firstCard.describe)"
                
                ImageLoader.sharedLoader.imageForUrl(firstCard.url, completionHandler:{(image: UIImage?, url: String) in
                    cardImageView.image = image
                })
                title = firstCard.category
                
                firstText.contentOffset = CGPointZero
            }
        }
    }
    
    func configureSecondCard() {
        if let secondCard = secondCard {
            if let  describeText = secondText, cardImageView = secondImageView {
                describeText.text = "\(secondCard.rating) \n\(secondCard.describe)"
                
                ImageLoader.sharedLoader.imageForUrl(secondCard.url, completionHandler:{(image: UIImage?, url: String) in
                    cardImageView.image = image
                })
                title = secondCard.category
                
                secondText.contentOffset = CGPointZero
            }
        }
    }
    
    func configureThirdCard() {
        if let thirdCard = thirdCard {
            if let  describeText = thirdText, cardImageView = thirdImageView {
                describeText.text = "\(thirdCard.rating) \n\(thirdCard.describe)"
                
                ImageLoader.sharedLoader.imageForUrl(thirdCard.url, completionHandler:{(image: UIImage?, url: String) in
                    cardImageView.image = image
                })
                title = thirdCard.category
                
                thirdText.contentOffset = CGPointZero
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFirstCard()
        configureSecondCard()
        configureThirdCard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
