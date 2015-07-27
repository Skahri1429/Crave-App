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
    var venues: [JSONParameters]!
    let tagData = TagData()
    var tagArray: [String] = TagData.returnReleventTags()
    let WALKING_DISTANCE = 1000
    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU&ll"
    
    let longitude = LocationHelper().latitude
    let latitude = LocationHelper().longitude
    
    var venueNamesArray: [String] = []
    
   /* func search(searchQuery: String) { // what is this for?
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
    */
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
    
    //FOR ONBOARDING PROCESS: HAVE USERS GO THROUGH THE FOOD/RESTAURANT CATEGORIES. FOOD TRUCKS, ETC.
    
    
    //get user tags to conduct search based on previous history
    //need to conduct 2 searches: one to find venues, filter them out by distance (e.g. <5 miles away)
    //from that list you need to order by cuisine type (find out which one they eat most)
    //
    

    func processJSON(json: String) -> String {
        let initialRequest = JSON(json)
        var temporaryArray: [JSON] = initialRequest["response"]["venues"]["name"].arrayValue
        
        for venueName in temporaryArray {
            venueNamesArray.append(venueName.stringValue)
        }
        println(venueNamesArray)
        
        return ""
    }
    
    func findVenues(long: String, lat:String, relevantSearchTerms: [String]) -> [String] { //complete. must test. link doesn't work.

        var jsonResponse: String!
        for tag in tagArray { // searching each tag using search term
            
            
            // how do i search by multiple categories with the URL? What URL do I use??
            Alamofire.request(.GET, "https://api.foursquare.com/v2/venues/search?ll=\(long),\(lat)&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150725").responseJSON {(request, response, JSON, error) in
                println(request)
                println(response)
                
                jsonResponse = JSON as! String
                
                if (error == nil) {
                    self.processJSON(jsonResponse)
                }
                
//                var json = JSON as! NSDictionary
//                
//                jsonFile += json
            }
        }
        return venueNamesArray
    }
    
    func sortVenues() {
        let tags = TagData()
//        let initialVenueArray = findVenues(tags)
        
        /* 
            first filter by walking distance
        
        */
        
        
            // foursquare has categories to which each venue subscribes, use that to filter out
        //foursquare has categories to which everything is a part of. you can onboard users using that categories to find out what they like.
        // USE SUGGESTCOMPLETION OR CATEGORIES FOR THIS PART.
        //from there you can filter out by suggested countries, so using user location, if one suggestion is recommended for their country and others have no recommendation, push that to the top.
        
        //return some sort of collection, like an array, of venues that you can search. return like 5.
    }

    func findMeals() {
        //this is where your TagData comes in. Use the results from sortVenues() to
    }
    
    func sortMeals() {
        //eliminate any foods based on dietary restrictions
        //sort based on distance from user, and number of tags that it hits. 
        //if there are less than five returned, then you might want to handle that. maybe pick something from the saved options. but that's for a later date.
    }
}