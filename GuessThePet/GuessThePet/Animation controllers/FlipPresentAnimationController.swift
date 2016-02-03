//
//  FlipPresentAnimationController.swift
//  GuessThePet
//
//  Created by 林东杰 on 2/3/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class FlipPresentAnimationController: NSObject,UIViewControllerAnimatedTransitioning {
    // MARK: - Constants
    
    // MARK: - Variables
    var originFrame = CGRect.zero
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    
    // MARK: - TableView Data Source
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 2.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //1
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        //2
        let initialFrame = originFrame
        let finalFrame = transitionContext.finalFrameForViewController(toVC)
        //3
        let snapshot = toVC.view.snapshotViewAfterScreenUpdates(true)
        snapshot.frame = initialFrame
        snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        toVC.view.hidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(containerView)
        snapshot.layer.transform = AnimationHelper.yRotation(M_PI_2)
        
        //1
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(duration, delay: 0, options: .CalculationModeCubic, animations: { () -> Void in
            //2
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: { () -> Void in
                fromVC.view.layer.transform = AnimationHelper.yRotation(-M_PI_2)
            })
            //3
            UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: { () -> Void in
                snapshot.layer.transform = AnimationHelper.yRotation(0.0)
            })
            //4
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: { () -> Void in
                snapshot.frame = finalFrame
            })
            }, completion: { _ in
                //5
                toVC.view.hidden = false
                fromVC.view.layer.transform = AnimationHelper.yRotation(0.0)
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }
    // MARK: - Navigation
    
    


}
