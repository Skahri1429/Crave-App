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
import Alamofire
import SwiftyJSON

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
    
    
    func conductSearch(relevantSearchTerms: TagData) -> [String] {
        let jsonFile: String!
        Alamofire.request(.GET, "https://api.foursquare.com/v2/venues/search?client_id=GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY&client_secret=KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU&ll=40.7,-74&query=\(relevantSearchTerms)&v=20140806&m=foursquare")
            .responseJSON { _, _, JSON, _ in
                println(JSON)
        }
        
        return ["stuff"]
        
        
    }
    
    func conductSearch() {}
}
