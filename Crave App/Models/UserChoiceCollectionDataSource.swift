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
    
    
    /** 
    
    ESSENTIAL PROBLEM: I need to find meals that match user taste. Current solution is to assign a tag to every meal and then see which meals match the user the best. Foursquare has "tastes" for users, but thousands of "tastes" available that I can't reproduce. I can access a user's tastes if they're signed up with Foursquare, but then what's the point of the app; they can just go use foursquare. Machine learning is an option but I havne't found any APIs that learn user preferences that I need.
    
    **/
    
    //get user tags to conduct search based on previous history
    //need to conduct 2 searches: one to find venues, filter them out by distance (e.g. <5 miles away)
    //from that list you need to order by cuisine type (find out which one they eat most)
    //
    
    func conductSearch(relevantSearchTerms: TagData) -> [String] {
        let jsonFile: String!
        Alamofire.request(.GET, "https://api.foursquare.com/v2/venues/search?client_id=GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY&client_secret=KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU&ll=40.7,-74&query=\(relevantSearchTerms)&v=20140806&m=foursquare")
            .responseJSON { _, _, JSON, _ in
                jsonFile = JSON
        }
        if let json = jsonFile["response"]["venues"][0]["im:name"]["label"].string {
            println("SwiftyJSON: \(appName)")
        }
        return ["stuff"]
        
        /*

        
    }
    
    func conductSearch() {}
}
