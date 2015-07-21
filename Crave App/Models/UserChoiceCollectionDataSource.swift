//
//  UserChoiceCollectionDataSource.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/20/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import CoreLocation
import QuadratTouch
import Foundation
typealias JSONParameters = [String: AnyObject]

class UserChoiceCollectionDataSource: PlateViewController {
    
    var location: CLLocation!
    var venues: [JSONParameters]!
    
    override func viewDidLoad() {
        //locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func searchFoursquare(searchQuery: String) {
        var parameters = [Parameter.query: searchQuery]
        parameters += self.location.parameters()
        let searchTask = self.session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                self.venues = response["venues"] as! [JSONParameters]?
                self.tableView.reloadData()
            }
        }
        searchTask.start()
    }
    
    
}
