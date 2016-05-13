//
//  Artwork.swift
//  HonoluluArt
//
//  Created by 林东杰 on 5/12/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import MapKit
import AddressBook

class ArtWork: NSObject,MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
//    func mapItem() -> MKMapItem {
//        let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
//        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
//        
//        let mapItem = MKMapItem(placemark: placemark)
//        mapItem.name = title
//        return mapItem
//    }
}
