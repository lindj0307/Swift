//
//  ViewController.swift
//  RWScrollViews
//
//  Created by 林东杰 on 1/8/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Variable
    var imageView: UIImageView!
    @IBOutlet var scrollView: UIScrollView!
    
    
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
        let image = UIImage(named: "photo1.png")!
        imageView = UIImageView(image: image)
        imageView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: image.size)
        scrollView.addSubview(imageView)
        
        //2
        scrollView.contentSize = image.size
        
        //3
        let doubleTapReconginizer = UITapGestureRecognizer(target: self, action: "scrollViewDoubleTapped:")
        doubleTapReconginizer.numberOfTapsRequired = 2
        doubleTapReconginizer.numberOfTouchesRequired = 1
        scrollView.addGestureRecognizer(doubleTapReconginizer)
        
        //4
        let scrollViewFrame = scrollView.frame
        let scaleWith = scrollViewFrame.size.width / scrollView.contentSize.width
        let scaleHeight = scrollViewFrame.size.height /  scrollView.contentSize.height
        let minScale = min(scaleWith,scaleHeight)
        scrollView.minimumZoomScale = minScale
        
        //5
        scrollView.maximumZoomScale = 1.0
        scrollView.zoomScale = minScale
        
        //6
        centerScrollViewContents()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - TableView Delegate
    
    // MARK: - TableView Datasource
    
    // MARK: - Custom Delegate
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        centerScrollViewContents()
    }
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func centerScrollViewContents() {
        let boundsSize = scrollView.bounds.size
        var contentsFrame = imageView.frame
        
        if contentsFrame.size.width < boundsSize.width {
            contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0
        } else { contentsFrame.origin.x = 0.0 }
        
        if contentsFrame.size.height < boundsSize.height {
            contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0
        } else { contentsFrame.origin.y = 0.0 }
        
        imageView.frame = contentsFrame
    }
    
    func scrollViewDoubleTapped(recognizer: UITapGestureRecognizer) {
        //1
        let pointInView = recognizer.locationInView(imageView)
        
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
        
    }
    
    // MARK: - Navigation
    
    





}

