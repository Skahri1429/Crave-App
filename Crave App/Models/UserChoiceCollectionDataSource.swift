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

class UserChoiceCollectionDataSource {
    var venues: [JSONParameters]!
    var distance: [JSONParameters]!
    var session : Session!
    
    let tagData = TagData()
    var tagArray: [String] = TagData.returnReleventTags()
    
    let WALKING_DISTANCE = 1000
    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU&ll"
    
    let longitude = LocationHelper().latitude
    let latitude = LocationHelper().longitude
    let location = LocationHelper().locationManager.location
    
    var venueNamesDictionary: [String: Int] = [:] //name : distance from user
    var finishedVenueNamesArray: [String: Int] = [:]
    
    let client: Client!
    

   
    func findVenues( )  { //complete. must test. link doesn't work.
            // where would i call this function? in view controller. call all other methods inside this. will return 
        var jsonResponse: String!
        for tag in tagArray { // searching each tag using search term
            
            var parameters = [Parameter.categoryId: tag]
            parameters += self.location.parameters() // error: location is optional, now nil
            let searchTask = session.venues.search(parameters) {
                (result) -> Void in
                
                if let response = result.response { //trying to create keys of names
                    for (key, value) in response {
                      //  self.venueNamesDictionary[key] = value as! String
                        println(key)
                        println(value)
                    
                    }
//                    for (var j = 0; j<response.count; j++) { //trying to assign distances from user to venue with meal
//                        let dist = response["venues"][j]["location"]["distance"]! as [JSONParameters]!
//                        let venues = response["venues"] as! [AnyObject]
//                        let temp = venues[j] as! [AnyObject]
//                        let loc = temp["location"] as! [AnyObject]
//                        
//                        self.distance = response["venues"][j]["location"]["distance"]! as [JSONParameters]
//                    }
//                    self.self.venueNamesDictionary[self.venues as String] = distance
                    
                    //self.tableView.reloadData()
                }
            }
            searchTask.start()
            
        }// end for
        
        
    }// end Function
    
//    func filterVenues(namesArray: [String]) -> [String] {
//        //get closest choice for each category ID.
//        //return array of closest venue names for each category ID
//    }
    
    func sortVenues(filteredNamesDictionary: [String: Int]) {
        //now sort by user taste. dictionary 1 or 0 from TagData.
        let names = filteredNamesDictionary
        let tempArray: [String] = []
        
        for (key, value) in names {
            //tempArray.append(key)
        }
        
        

    }

    func findMeals() { //REUSABLE IN CHOOSEVIEWCONTROLLER
        //this is where your TagData comes in. Use the filtered, sorted array to find meals for each venue element in array
        //parse descriptions of each menu item.
        //get a counter for number of ingredients matched (TO WHAT? Are you finding common ingredients in onboarding process?)
        //sort by counter, highest to lowest.
        
        //return top 5 meals.
    }
    
    func sortMeals() { //currently unnecessary
        //eliminate any foods based on dietary restrictions
        //sort based on distance from user, and number of tags that it hits. 
        //if there are less than five returned, then you might want to handle that. maybe pick something from the saved options. but that's for a later date.
    }
    
    init() {
        //super.init()
        client = Client(clientID: CLIENT_ID,
            clientSecret: CLIENT_SECRET,
            redirectURL:    "craveapp://foursquare")
        var configuration = Configuration(client: client)
        
        let session = Session.sharedSession()
        
        //        Session.setupSharedSessionWithConfiguration(configuration)
    }
}

extension CLLocation {
    func parameters() -> Parameters {
        let ll      = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc   = "\(self.horizontalAccuracy)"
        let alt     = "\(self.altitude)"
        let altAcc  = "\(self.verticalAccuracy)"
        let parameters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}
