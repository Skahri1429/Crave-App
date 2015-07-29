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
    var categoryTagSearch: [String] = TagData.returnRelevantCategories()
    
    lazy var numElements: Int = {
        
    return self.categoryTagSearch.count
}()
    var counter = 0
    
    let WALKING_DISTANCE = 1000
    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU&ll"
    
    let locationManager = LocationHelper()
    
    var venueNamesDictionary: [String: Int] = [:] //name : distance from user
    var finishedVenueNamesArray: [String] = []
    
   let client: Client!
   
    func findVenues() -> [String] { //complete. must test. link doesn't work.
            // where would i call this function? in view controller. call all other methods inside this. will return
        let longitude = locationManager.longitude
        let latitude = locationManager.latitude
        
        if counter == numElements {
            let tempSortedNames = sortVenues(venueNamesDictionary)
            finishedVenueNamesArray = filterVenues(tempSortedNames)
        } else {
        
           for tag in categoryTagSearch {
            
            let urlString = "https://api.foursquare.com/v2/venues/search?ll=\(longitude),\(latitude)&categoryId=\(tag)&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
            
            if let url = NSURL(string: urlString) {
                if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                    let json = JSON(data: data)
                    if json["meta"]["code"].intValue == 200 {
                        // we're OK to parse!
                        for result in json["response"].arrayValue {
                            venueNamesDictionary[result["venues"]["name"].stringValue] = result["venues"]["location"]["distance"].int
                            counter++
                        }
                    
                    } else {
                        println("Error in retrieving JSON")
                    }
                    
                    
                }
            }
            
//            let searchTask = session.venues.search(tag) {
//                (result) -> QuadratTouch.Task in
//                
//                if let response = result.response { //trying to create keys of names with values of distances
//                    let count: Int? = response["venues"].array?.count
//                    let venueName: [String] = response["venues"]["name"].arrayValue
//                    let distanceValue: [Int] = response["venues"]["location"]["distance"].arrayValue
//                    
//                    for (i = 0; i < count; i++) {
//                        venueNamesDictionary[venueName[i]] = distanceValue[i]
//                    }
//                }
//                
//            }// end closure
//            
//            searchTask.start()
//            
//            counter++
            
            }// end for
        }// end else
        
        return finishedVenueNamesArray
        
    }// end Function
    
    
    func sortVenues(filteredNamesDictionary: [String: Int]) -> [String] {
        //now sort by distance. dictionary 1 or 0 from TagData.
        let codeValueDict = filteredNamesDictionary
        let sortedKeysAndValues = sorted(codeValueDict) { $0.1 < $1.1 } //sorted dictionary
        let keys = sortedKeysAndValues.map {$0.0 } // names sorting complete
        let values = sortedKeysAndValues.map {$0.1 } // distances sorting complete
        let sortedNamesArray = keys
        return sortedNamesArray
    }
    
    func filterVenues(namesArray: [String]) -> [String] {
    //get closest choice for each category ID.
    //return array of closest venue names for each category ID
        
        //or could just truncate.
        let truncatedNamesArray: [String]!
        for(var i = 0; i<15; i++) {
            truncatedNamesArray[i] = namesArray[i]
        }
        
        //THIS IS WHAT HAPPENS WHEN YOU DON'T PLAN AHEAD!
//        //for each tag
//        for tag in categoryTagSearch {
//            //search through names
//        }
        
        return truncatedNamesArray
   }

    func findMeals(venueNamesArray: [String]) { //REUSABLE IN CHOOSEVIEWCONTROLLER
        //this is where your TagData comes in. Use the filtered, sorted array to find meals for each venue element in array
        //parse descriptions of each menu item.
        //get a counter for number of ingredients matched (TO WHAT? Are you finding common ingredients in onboarding process?)
        //sort by counter, highest to lowest.
        
        //return top 5 mealxs.
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
