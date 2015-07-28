//
//  LocationHelper.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/25/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import CoreLocation
import QuadratTouch

class LocationHelper: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var latitude: String!
    var longitude: String!

    func setupLocation() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.requestAlwaysAuthorization()
    locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        NSLog("didFailWithError: %@", error)
//        var errorAlert: UIAlertView = UIAlertView(title: "Error", message: "Failed to Get Your Location", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
//        errorAlert.show()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        NSLog("didUpdateToLocation: %@", newLocation)
        var currentLocation: CLLocation? = newLocation
        
        locationManager.stopUpdatingLocation()
    }
    
    override init() {
        super.init()
        self.setupLocation()
        let lat = self.latitude
        let long = self.longitude
        let loc = self.locationManager.location
    }

}