//
//  SwipeInteractionController.swift
//  GuessThePet
//
//  Created by 林东杰 on 2/14/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class SwipeInteractionController: UIPercentDrivenInteractiveTransition {
 
    // MARK: - Constants
    
    // MARK: - Variables
    var interactionProgress = false
    private var shouldCompleteTransition = false
    private weak var viewController: UIViewController!
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    
    // MARK: - TableView Data Source
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func wireToViewController(viewController: UIViewController!) {
        self.viewController = viewController
        prepareGuestureRecognizerInView(viewController.view)
    }
    
    func prepareGuestureRecognizerInView(view: UIView) {
        let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: "handleGesture:")
        gesture.edges = UIRectEdge.Left
        view.addGestureRecognizer(gesture)
    }
    
    func handleGesture(gestureRecognizer:UIScreenEdgePanGestureRecognizer) {
        //1
        let transition = gestureRecognizer.translationInView(gestureRecognizer.view!.superview!)
        var progress = (transition.x/200)
        progress = CGFloat(fminf(fmaxf(Float(progress),0.0),1.0))
        
        switch gestureRecognizer.state {
        case .Began:
            //2
            interactionProgress = true
            viewController.dismissViewControllerAnimated(true , completion: nil)
            
        case .Changed:
            //3
            shouldCompleteTransition = progress>0.5
            updateInteractiveTransition(progress)
            
        case .Cancelled:
            //4
            interactionProgress = false
            cancelInteractiveTransition()
            
        case .Ended:
            //5
            interactionProgress = false
            if !shouldCompleteTransition {
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
            
        default:
            print("Unsupported")
        }
    }
    
    // MARK: - Navigation
    
    


}
