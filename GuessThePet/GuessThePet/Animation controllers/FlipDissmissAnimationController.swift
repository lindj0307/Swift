//
//  FlipDissmissAnimationController.swift
//  GuessThePet
//
//  Created by 林东杰 on 2/14/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class FlipDissmissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    var destinationFrame = CGRectZero
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.6
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
        let containerView = transitionContext.containerView(),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        //1
        let initialFrame = transitionContext.initialFrameForViewController(fromVC)
        let finalFrame = destinationFrame
        
        //2
        let snapshot = fromVC.view.snapshotViewAfterScreenUpdates(false)
        snapshot.layer.cornerRadius = 25
        snapshot.layer.masksToBounds = true
        
        //3
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshot)
        fromVC.view.hidden = true
        
        AnimationHelper.perspectiveTransformForContainerView(containerView)
        
        //4
        toVC.view.layer.transform = AnimationHelper.yRotation(-M_PI_2)
        
        
        let duration = transitionDuration(transitionContext)
        
        UIView.animateKeyframesWithDuration(duration, delay: 0, options: .CalculationModeCubic, animations: { () -> Void in
            //1
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1/3, animations: { () -> Void in
                snapshot.frame = finalFrame
            })
            
            UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: { () -> Void in
                snapshot.layer.transform = AnimationHelper.yRotation(M_PI_2)
            })
            
            UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: { () -> Void in
                toVC.view.layer.transform = AnimationHelper.yRotation(0.0)
            })
            
            }, completion: { _ in
                //2
                fromVC.view.hidden = false
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
    }

}
