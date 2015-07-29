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
    let coordinate = CLLocationDegrees()
    let longitude: CLLocationDegrees!
    let latitude: CLLocationDegrees!
    var locValue: CLLocationCoordinate2D!

    func setupLocation() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.delegate = self
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
        locationManager.stopUpdatingLocation()
        locValue = locationManager.location.coordinate
        //println("locations = \(locValue.latitude) \(locValue.longitude)")
    }

    
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        NSLog("didFailWithError: %@", error)
////        var errorAlert: UIAlertView = UIAlertView(title: "Error", message: "Failed to Get Your Location", delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: nil)
////        errorAlert.show()
//    }
//    
//    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
//        NSLog("didUpdateToLocation: %@", newLocation)
//        var currentLocation: CLLocation? = newLocation
//        println(currentLocation)
//        locationManager.stopUpdatingLocation()
//    }
    
    override init() {
        super.init()
        self.setupLocation()
        longitude = self.locValue.longitude
        latitude = self.locValue.latitude
    }

}