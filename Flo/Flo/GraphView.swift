//
//  GraphView.swift
//  Flo
//
//  Created by 林东杰 on 5/10/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

@IBDesignable class GraphView: UIView {
    
    var graphPoints:[Int] = [4,2,6,4,5,8,3]

    @IBInspectable var startColor: UIColor = UIColor.redColor()
    @IBInspectable var endColor:UIColor = UIColor.greenColor()
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.CGColor,endColor.CGColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let colorLocation: [CGFloat] = [0.0,0.1]
        let gradient = CGGradientCreateWithColors(colorSpace, colors, colorLocation)
        
        var startPoint = CGPointZero
        var endPoint = CGPoint(x: 0, y: self.bounds.height)
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions.DrawsAfterEndLocation)
        
        let width = rect.width
        let height = rect.height
        var path = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: CGSize(width: 1, height: 1))
        
        path.addClip()
        
        
        let margin: CGFloat = 20.0
        var columnXPoint = { (column: Int) -> CGFloat in
            let spacer = (width - margin * 2 - 4) / CGFloat((self.graphPoints.count - 1))
            var x:CGFloat = CGFloat(column) * spacer
            x += margin + 2
            return x
        }
        
//        let topBorder:CGFloat = 60
//        let bottomBorder:CGFloat = 50
//        let graphHeight = height - topBorder - bottomBorder
//        let maxValue = maxElement(graphPoints)
//        var columnYPoint = { (graphPoint:Int) -> CGFloat in
//            var y:CGFloat = CGFloat(graphPoint) /
//                CGFloat(maxValue) * graphHeight
//            y = graphHeight + topBorder - y // Flip the graph
//            return y
//        }
    }
    

}
