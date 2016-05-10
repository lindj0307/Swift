//
//  CounterView.swift
//  Flo
//
//  Created by 林东杰 on 5/6/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let pi: CGFloat = CGFloat(M_PI)

@IBDesignable class CounterView: UIButton {

    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= NoOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = UIColor.blueColor()
    @IBInspectable var counterColor: UIColor = UIColor.orangeColor()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        //1
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        
        //2
        let radius: CGFloat = max(bounds.width,bounds.height)
        
        //3
        let arcWidth: CGFloat = 76
        
        //4
        let startAngle: CGFloat = 3 * pi / 4
        let endAngle: CGFloat = pi / 4
        
        //5
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //6
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat  = 2 * pi - startAngle + endAngle
        
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        outlinePath.addArcWithCenter(center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.closePath()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
    }

}
