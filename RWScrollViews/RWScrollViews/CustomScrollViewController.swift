//
//  CustomScrollViewController.swift
//  RWScrollViews
//
//  Created by 林东杰 on 1/12/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class CustomScrollViewController: UIViewController , UIScrollViewDelegate {
    
    // MARK: - Variable
    @IBOutlet var scrollView: UIScrollView!
    var containerView: UIView!
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set up the container view to hold your custom view hierarchy
        let containerSize = CGSize(width: 640.0, height: 640.0)
        containerView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: containerSize))
        scrollView.addSubview(containerView)
        
        //Set up you custom view hierachy
        let redView = UIView(frame: CGRect(x: 0, y: 0, width: 640, height: 80))
        redView.backgroundColor = UIColor.redColor()
        containerView.addSubview(redView)
        
        let blueView = UIView(frame: CGRect(x: 0, y: 560, width: 640, height: 80))
        blueView.backgroundColor = UIColor.blueColor()
        containerView.addSubview(blueView)
        
        let greenView = UIView(frame: CGRect(x: 160, y: 160, width: 320, height: 320))
        greenView.backgroundColor = UIColor.greenColor()
        containerView.addSubview(greenView)
        
        let imageView = UIImageView(image: UIImage(named: "slow.png"))
        imageView.center = CGPoint(x: 320, y: 320)
        containerView.addSubview(imageView)
        
        //Tell the Scroll view the size of the contents
        scrollView.contentSize = containerSize
        
        //Set up the minimum & maximum zoom scales
        let scrollvViewFrame = scrollView.frame
        let scaleWidth = scrollvViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollvViewFrame.size.height / scrollView.contentSize.height
        let minScale = min(scaleWidth,scaleHeight)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = 1.0
        
        centerScrollViewContents()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView Datasource
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return containerView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = containerView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else { contentsFrame.origin.x = 0.0 }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else { contentsFrame.origin.y = 0.0 }
        
        containerView.frame = contentsFrame
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        /*
        //1
        let pointInView = recognizer.locationInView(containerView)
        
        //2
        var newZoomScale = scrollView.zoomScale * 1.5
        newZoomScale = min(newZoomScale,scrollView.maximumZoomScale)
        
        //3
        let scrollViewSize = scrollView.bounds.size
        let w = scrollViewSize.width / newZoomScale
        let h = scrollViewSize.height / newZoomScale
        let x = pointInView.x - (w / 2.0)
        let y = pointInView.y - (h / 2.0)
        
        let rectToZoomTo = CGRectMake(x, y, w, h)
        
        //4
        scrollView.zoomToRect(rectToZoomTo, animated: true)
        */
    }
    // MARK: - Navigation
    
    



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
