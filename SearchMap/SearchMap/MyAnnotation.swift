//
//  MyAnnotation.swift
//  SearchMap
//
//  Created by 林东杰 on 15/7/17.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import UIKit
import MapKit


class MyAnnotation: NSObject,MKAnnotation {
    var coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)
    var title:String!
    init(coordinate: CLLocationCoordinate2D,title:String) {
        self.coordinate = coordinate
        self.title = title;
    }
}
