//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 林东杰 on 12/15/15.
//
//

import UIKit

class RatingControl: UIView {
    
    // MARK: - Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    
    var spacing = 5
    var stars = 5

    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        for _ in 0..<stars {
            let filledStarImage = UIImage(named: "filledStar")
            let emptyStarImage = UIImage(named: "emptyStar")
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            //button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            addSubview(button)
        }
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing ) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for (index, button ) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
    
    
    // MARK: - Button Action
    func ratingButtonTapped(button: UIButton) {
        //print("Button pressed 👍")
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
