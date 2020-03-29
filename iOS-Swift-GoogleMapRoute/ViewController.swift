//
//  ViewController.swift
//  iOS-Swift-GoogleMapRoute
//
//  Created by Pooya on 2020-03-22.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class ViewController: UIViewController , GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        
        //Location Manager to fetch curent Location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 14)
        
        mapView.animate(to: camera)
        
        self.locationManager.stopUpdatingLocation()
    }

}

