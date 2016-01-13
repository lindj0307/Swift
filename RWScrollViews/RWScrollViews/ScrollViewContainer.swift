//
//  ScrollViewContainer.swift
//  RWScrollViews
//
//  Created by 林东杰 on 1/12/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class ScrollViewContainer: UIView {

    @IBOutlet var scrollView: UIScrollView!
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, withEvent: event)
        if let theView = view {
            if theView == self {
                return scrollView
            }
        }
        return view
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
