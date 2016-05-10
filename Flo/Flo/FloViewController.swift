//
//  FloViewController.swift
//  Flo
//
//  Created by 林东杰 on 5/9/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class FloViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Variables
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    // MARK: - Properties
    var isGraphViewShowing = false 
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(counterView.counter)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView Data Source
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    
    // MARK: - Navigation
    
    // MARK: - Action
    
    @IBAction func btnPushButton(sender: PushButtonView) {
        if sender.isAddButton {
            if counterView.counter < NoOfGlasses {
                counterView.counter += 1
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        if isGraphViewShowing {
            counterViewTap(nil)
        }
    }

    @IBAction func counterViewTap(sender: UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            UIView.transitionFromView(graphView, toView: counterView, duration: 1.0, options:  UIViewAnimationOptions.TransitionFlipFromLeft , completion: nil)
        } else {
            UIView.transitionFromView(counterView, toView: graphView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromRight , completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
