//
//  ViewController.swift
//  DynamicsDemo
//
//  Created by 林东杰 on 5/4/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollisionBehaviorDelegate {

    // MARK: - Constants
    
    // MARK: - Variables
    
    // MARK: - Properties
    var animator: UIDynamicAnimator!
    var gravity:UIGravityBehavior!
    var collision: UICollisionBehavior!
    var firstContact = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        let barrier = UIView(frame: CGRect(x: 0, y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        
        let itemBehaviour = UIDynamicItemBehavior(items:[square])
        itemBehaviour.elasticity = 0.5
        animator.addBehavior(itemBehaviour)
        
        var updateCount = 0
        collision.action = {
           // print("\(NSStringFromCGAffineTransform(square.transform))\(NSStringFromCGPoint(square.center)))")
            if (updateCount % 3 == 0) {
                let outline = UIView(frame: square.bounds)
                outline.transform = square.transform
                outline.center = square.center
                
                outline.alpha = 0.5
                outline.backgroundColor = UIColor.clearColor()
                outline.layer.borderColor = square.layer.presentationLayer()?.backgroundColor
                outline.layer.borderWidth = 1.0
                self.view.addSubview(outline)
            }
            updateCount += 1
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Data Source
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, atPoint p: CGPoint) {
        print("Boundary contact occurred - \(identifier)")
        let collidingView = item as! UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(0.3) {
            collidingView.backgroundColor = UIColor.grayColor()
        }
        
        if (!firstContact) {
            firstContact = true
            
            let square = UIView(frame: CGRect(x: 30, y: 0, width: 100, height: 100))
            square.backgroundColor = UIColor.grayColor()
            view.addSubview(square)
            collision.addItem(square)
            gravity.addItem(square)
            
            let attach = UIAttachmentBehavior(item: collidingView, attachedToItem: square)
            animator.addBehavior(attach)
        }
    }
    // MARK: - Event Response
    
    // MARK: - Private Methods
    
    // MARK: - Navigation
    
    




}

