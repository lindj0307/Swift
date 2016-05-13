//
//  HonoluluArtViewController.swift
//  HonoluluArt
//
//  Created by 林东杰 on 5/11/16.
//  Copyright © 2016 Joey. All rights reserved.
//

import UIKit
import MapKit

class HonoluluArtViewController: UIViewController {
    
    // MARK: - Constants
    let regionRadius: CLLocationDistance = 1000
    
    // MARK: - Variables
    
    @IBOutlet weak var mapView: MKMapView!
    // MARK: - Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initiallLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        
        centerMapOnLocation(initiallLocation)
        
        let artwork = ArtWork(title: "King David Kalakaua", locationName: "Waikiki Gateway Park", discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 21.283921, longitude: -157.831661))
        mapView.addAnnotation(artwork)
        
        mapView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    // MARK: - TableView Data Source
    
    // MARK: - TableView Delegate
    
    // MARK: - Custom Delegate
    
    // MARK: - Event Response
    
    // MARK: - Private Methods
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
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
