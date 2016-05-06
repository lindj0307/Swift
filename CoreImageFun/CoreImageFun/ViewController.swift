//
//  ViewController.swift
//  CoreImageFun
//
//  Created by 林东杰 on 5/5/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    // MARK: - Variables
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var amountSlider: UISlider!
    
    var context: CIContext!
    var filter: CIFilter!
    var beginImage: CIImage!
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = NSBundle.mainBundle().URLForResource("image", withExtension: "png")
        
        let beginImage = CIImage(contentsOfURL: fileURL!)
        
        let filter = CIFilter(name: "CISepiaTone")
        filter!.setValue(beginImage, forKey: kCIInputImageKey)
        filter!.setValue(0.5, forKey: kCIInputIntensityKey)
        
        //let newImage = UIImage(CIImage: filter!.outputImage!)
        //self.imageView.image = newImage
        let context = CIContext(options: nil)
        
        let cgimg = context.createCGImage(filter!.outputImage!, fromRect: filter!.outputImage!.extent)
        
        let newImage = UIImage(CGImage: cgimg)
        self.imageView.image = newImage
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
    
    




}

