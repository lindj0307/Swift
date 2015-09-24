//
//  ViewController.swift
//  SearchMap
//
//  Created by 林东杰 on 15/7/16.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnHotel: UIButton!
    @IBOutlet weak var btnHospital: UIButton!
    @IBOutlet weak var btnSM: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    //初始化位置,厦门中山路
    let initialLocation = CLLocation(latitude: 24.4604090000, longitude: 118.0876380000)
    //设置搜索范围
    let searchRadius: CLLocationDistance = 4000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //对三个按钮的设置
        self.btnMenu.alpha = 0 //透明度设置为0
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
        //创建一个区域,以initialLocation为中心,半径4公里的范围的矩形区域
        let region = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, searchRadius, searchRadius)
        //设置显示
        mapView.setRegion(region, animated: true)
        
        searchMap("place")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnMenuClick(sender: AnyObject) {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.btnMenu.transform = CGAffineTransformMakeRotation(0)
            self.btnHotel.alpha = 0.9
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(-80, -25))
            self.btnHospital.alpha = 0.9
            self.btnHospital.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(0, -50))
            self.btnSM.alpha = 0.9
            self.btnSM.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.5,1.5), CGAffineTransformMakeTranslation(80, -25))
            }, completion:nil)
    }
    
    @IBAction func buttonReset(sender: AnyObject) {
        
        let btnTitle = sender.currentTitle!
        mapView.removeAnnotations(mapView.annotations)
        //println(btnTitle)
        switch btnTitle {
        case Optional.Some("旅馆"):
            searchMap("hotel")
        case Optional.Some("医院"):
            searchMap("hospital")
        case Optional.Some("超市"):
            searchMap("supermarket")
        default:
            searchMap("supermarket")
        }
        reset()
    }
    
    //重置按钮的初始状态
    func reset() {
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            //旋转90度
            self.btnMenu.transform = CGAffineTransformMakeRotation(0.25 * 3.1415927)
            //动画回归原始位置
            self.btnHotel.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, 0))
            //设置背景透明
            self.btnHotel.alpha = 0
            self.btnHospital.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1), CGAffineTransformMakeTranslation(0, 0))
            //设置背景透明
            self.btnHospital.alpha = 0
            self.btnSM.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1,1 ), CGAffineTransformMakeTranslation(0, 0))
            //设置背景透明
            self.btnSM.alpha = 0
            
        }, completion: nil)
    }
    
    //增加兴趣地点
    func addLocation(title:String,latitude:CLLocationDegrees,longtitude:CLLocationDegrees) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longtitude)
        let annotation  = MyAnnotation(coordinate: location, title: title)
        mapView.addAnnotation(annotation)
        
    }
    
    //搜索
    func searchMap(place:String) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = place
        //搜索当前设置区域
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
        //启动搜索并返回结果保存在数组中
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { (response:MKLocalSearchResponse!, error:NSError!) -> Void in
            for item in response.mapItems as![MKMapItem] {
                self.addLocation(item.name, latitude: item.placemark.location.coordinate.latitude, longtitude: item.placemark.location.coordinate.longitude)
            }
        }
    }
    


}








