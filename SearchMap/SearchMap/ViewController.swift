//
//  ViewController.swift
//  SearchMap
//
//  Created by 林东杰 on 15/7/16.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnHotel: UIButton!
    @IBOutlet weak var btnHospital: UIButton!
    @IBOutlet weak var btnSM: UIButton!

    
    @IBAction func btnMenuClick(sender: AnyObject) {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.btnMenu.transform = CGAffineTransformMakeRotation(0)
            self.btnHotel.alpha = 0.8
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(-80, -25))
            self.btnHospital.alpha = 0.8
            self.btnHospital.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(0, -50))
            self.btnSM.alpha = 0.8
            self.btnSM.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(80, -25))
            }, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnMenu.alpha = 0 //透明度设置为0
        //对三个按钮的设置
        self.btnHotel.alpha = 0
        self.btnHospital.alpha = 0
        self.btnSM.alpha = 0
        btnHotel.layer.cornerRadius = 12
        btnHospital.layer.cornerRadius = 12
        btnSM.layer.cornerRadius = 12
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.btnMenu.alpha = 1 //在一秒的将透明度设置为1
            self.btnMenu.transform = CGAffineTransformMakeRotation(0.25 * 3.1415927)
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

