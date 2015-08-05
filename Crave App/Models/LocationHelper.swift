//
//  LocationHelper.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/25/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import CoreLocation

class LocationHelper: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var locValue: CLLocationCoordinate2D!

    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        let status = CLLocationManager.authorizationStatus()
        if status == .NotDetermined {
            locationManager.requestWhenInUseAuthorization()
        } else if status == CLAuthorizationStatus.AuthorizedWhenInUse
            || status == CLAuthorizationStatus.AuthorizedAlways {
                locationManager.startUpdatingLocation()
        } else {
            println("No permissions")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locValue = locationManager.location.coordinate
        
    }
    
    // TODO: func getCurrentLocation
    // take a closure that takes CLLocation and returns Void
    // check if locValue exists
    // if not ???
    // otherwise perform closure that takes CLLocation and returns Void
    
    override init() {
        super.init()
        self.setupLocation()
        let location = self.locValue
    }

}