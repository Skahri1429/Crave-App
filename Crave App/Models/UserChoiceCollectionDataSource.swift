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
import AlamoFire

typealias JSONParameters = [String: AnyObject]

class UserChoiceCollectionDataSource: PlateViewController {
    
    var location: CLLocation!
    var venues: [JSONParameters]!
    
    override func viewDidLoad() {
        //locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func search(searchQuery: String) {
        var parameters = [Parameter.query: searchQuery]
        parameters += self.location.parameters()
        let searchTask = self.session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                self.venues = response["venues"] as! [JSONParameters]?
                //self.tableView.reloadData()
            }
        }
        searchTask.start()
    }
    
    /**
    Get user location (check)
    Handle onboarding later, assume they have some history right now
    
    Need method for venue frequency and selection
    See which tags have most frequency.
    Search using the top 5 tags. 
    
    Order the results based on location, rating, etc. (create method for weights of results)
    
    Get the top 5 search results
    
    Display the top 5 search results in PlateTableViewCell.
    */
    
    
    func tagSearchTerms() -> [String] {
        Alamofire.request(.GET, "http://httpbin.orgget")
            .responseJSON { _, _, JSON, _ in
                println(JSON)
        }
    }
    
    func conductSearch()
}
