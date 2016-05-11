//
//  DynamicTossViewController.swift
//  DynamicToss
//
//  Created by 林东杰 on 5/10/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class DynamicTossViewController: UIViewController {
    
    // MARK: - Constants
    let ThrowingThreshold: CGFloat = 1000
    let ThrowingVelocityPadding: CGFloat = 35
    
    // MARK: - Variables
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var redSquare: UIView!
    @IBOutlet weak var blueSqare: UIView!
    // MARK: - Properties
    private var originalBounds = CGRectZero
    private var originalCenter = CGPointZero
    
    private var animator: UIDynamicAnimator!
    private var attchmentBehavior: UIAttachmentBehavior!
    private var pushBehavior: UIPushBehavior!
    private var itemBehavior: UIDynamicItemBehavior!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        originalBounds = imageView.bounds
        originalCenter = imageView.center
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - TableView Data Source
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func resetDemo() {
        animator.removeAllBehaviors()

        UIView.animateWithDuration(0.45) {
            self.imageView.bounds = self.originalBounds
            self.imageView.center = self.originalCenter
            self.imageView.transform = CGAffineTransformIdentity
        }
    }
    
    // MARK: - Navigation
    
    // MARK: - Action
    @IBAction func handleAttachmentGesture(sender: UIPanGestureRecognizer) {
        let location = sender.locationInView(self.view)
        let boxLocation = sender.locationInView(self.imageView)
        switch sender.state {
        case .Began:
            print("Your touch start position is \(location)")
            //1
            animator.removeAllBehaviors()
            //2
            let centerOffset = UIOffset(horizontal: boxLocation.x - imageView.bounds.midX, vertical: boxLocation.y - imageView.bounds.midY)
            attchmentBehavior = UIAttachmentBehavior(item: imageView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            //3
            redSquare.center = attchmentBehavior.anchorPoint
            blueSqare.center = location
            //4
            animator.addBehavior(attchmentBehavior)
            print("Start location in image is \(boxLocation)")
        case .Ended:
            print("Your touch end position is \(location)")
            //resetDemo()
            print("End location in image is \(boxLocation)")
            
            animator.removeAllBehaviors()
            
            //1
            let velocity = sender.velocityInView(view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            
            if magnitude > ThrowingThreshold {
                //2
                let pushBehavior = UIPushBehavior(items: [imageView], mode: .Instantaneous)
                pushBehavior.pushDirection = CGVector(dx: velocity.x / 10, dy: velocity.y / 10)
                pushBehavior.magnitude = magnitude / ThrowingVelocityPadding
                
                self.pushBehavior = pushBehavior
                animator.addBehavior(pushBehavior)
                
                //3
                let angle = Int(arc4random_uniform(20)) - 10
                itemBehavior = UIDynamicItemBehavior(items: [imageView])
                itemBehavior.friction = 0.2
                itemBehavior.allowsRotation = true
                itemBehavior.addAngularVelocity(CGFloat(angle), forItem: imageView)
                animator.addBehavior(itemBehavior)
                
                //4
                let timeOffset = Int64(0.4 * Double(NSEC_PER_SEC))
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, timeOffset), dispatch_get_main_queue()) {
                    self.resetDemo()
                }
            } else {
                resetDemo()
            }
        default:
            attchmentBehavior.anchorPoint = sender.locationInView(view)
            redSquare.center = attchmentBehavior.anchorPoint
        }
        
        
    }
}
