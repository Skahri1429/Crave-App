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
    let ingredientData: [String] = tagData.ingredients
    
    let mealObject = MealObject()
    let foundMeals: [mealObject] = []
    
    lazy var numElements: Int = {
        
    return self.categoryTagSearch.count
}()
    var counter = 0
    
    let WALKING_DISTANCE = 1000
    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU"
    
    let locationManager = LocationHelper()
    
    var venueNamesDictionary: [String: (Int, String)] = [:] //name : (distance from user, venueID)
    var finishedVenueNamesDictiontary: [String: String] = [:] //name: venueID
    
   let client: Client!
   
    func findVenues() -> [String] {
        let longitude = locationManager.longitude
        let latitude = locationManager.latitude
        
        if counter == numElements {
            
            let tempSortedNamesDictionary = sortVenues(venueNamesDictionary)
            finishedVenueNamesDictiontary = filterVenues(tempSortedNamesDictionary)
            
        } else {
        
           for tag in categoryTagSearch {
            
            let urlString = "https://api.foursquare.com/v2/venues/search?ll=\(longitude),\(latitude)&categoryId=\(tag)&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
            
            if let url = NSURL(string: urlString) {
                if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                    let json = JSON(data: data)
                    if json["meta"]["code"].intValue == 200 {
                        // we're OK to parse!
                        for result in json["response"].arrayValue {
                            venueNamesDictionary[result["venue"]["name"].stringValue] = (distance: result["venues"]["location"]["distance"].int!, id: result["venue"]["id"].stringValue)
                            
                            /*
                            let mealObject = MealObject()
                            let foundMeals: [mealObject] = []
                                mealObject.longitudeOfVenue = result["venue"]["location"]["lng"].stringValue
                                mealObject.latitudeOfVenue = result["venue"]["location"]["lat"].stringValue
                                mealObject.addressofVenue = result["venue"]["location"]["formattedAddress"].stringValue
                                mealObject.distanceToVenue = result["venues"]["location"]["distance"].int!
                                foundMeals.append(mealObject)
                            */
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
    
    
    func sortVenues(filteredNamesDictionary: [String: (Int, String)]) -> [String: Int] {
        //now sort by distance. dictionary 1 or 0 from TagData.
        for key in filteredNamesDictionary.keys {
            let codeValueDict[key] = filteredNamesDictionary.values.0
        }
        let sortedKeysAndValues = sorted(codeValueDict) { $0.1 < $1.1 } //sorted dictionary
        let keys = sortedKeysAndValues.map {$0.0 } // names sorting complete
        let values = sortedKeysAndValues.map {$0.1 } // distances sorting complete
        for key in keys {
            for value in values {
                let sortedNamesDictionary[key] = value //names, distance
            }
        }
        return sortedNamesDictionary
    }
    
    
    func filterVenues(namesDictionary: [String: Int]) -> [String: String] {
    //get closest choice for each category ID.
    //return array of closest venue names for each category ID
        
        //truncating to first 15 restaurants sorted by distance.
        
        let holder = namesDictionary.keys
        let truncatedNamesArray: [String]!
        for(var i = 0; i<15; i++) {
            truncatedNamesArray[i] = holder[i]
        }
        
        //THIS IS WHAT HAPPENS WHEN YOU DON'T PLAN AHEAD!
//        //for each tag
//        for tag in categoryTagSearch {
//            //search through names
//        }
        
        return truncatedNamesArray
   }

    func findMeals(venueInfoDictionary: [String: (distance: Int, ID: String)]) { //REUSABLE IN CHOOSEVIEWCONTROLLER
        //this is where your TagData comes in. Use the filtered, sorted array to find meals for each venue element in array
        
        let venuesToSearch = venueInfoDictionary.ID
        let sortedMealObjects: [MealObject]
        
        for menu in venuesToSearch {
            
            let urlString = "https://api.foursquare.com/v2/venues/\(VENUE_ID)/menu&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
            
            if let url = NSURL(string: urlString) { // if #1
                if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) { //if #2
                    let json = JSON(data: data)
                    if json["meta"]["code"].intValue == 200 { //if #3
                        if json["response"]["menu"]["menus"]["count"].int == 1 { //if #4
                            
                            for subcategories in json["response"]["menu"]["menus"]["items"]["entries"]["items"].arrayValue {
                                
                                for dishes in json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"].arrayValue {
                                
                                    mealObject.mealTitle = json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"]["name"].stringValue
                                    mealObject.mealDescription = json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"]["description"].stringValue
                                    mealObject.priceValue = json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"]["price"].stringValue
                                    foundMeals.append(mealObject)
                                    
                                }
                            }
                    
                        }// end if #4
                    
                } else {
                        println("Error in retrieving JSON")
                } // end else
                    
        }
      } //end if #1
            
            searchMealDescriptions(foundMeals)
            sortedMealObjects = sortMeals(foundMeals)
            // search Meal descriptions
            //sort meal descriptions
            // add number 1 to new array of top MealObjects
            
      } // end big for
    return sortedMealObjects
    }// end fuction
    
    func searchMealDescriptions(meals: [MealObject]) {
        
        let mealObjectArray = meals
        for mealItem in mealObjectArray {
            let mealDescription = mealItem.mealDescription // [String] of meal descriptions
            let characterSet: NSCharacterSet = NSCharacterSet.punctuationCharacterSet()
            let mealDescriptionWordsArray = mealDescription.componentsSeparatedByCharactersInSet(characterSet)
            var trimmedWordsArray = (mealDescription.componentsSeparatedByCharactersInSet(characterSet) as NSArray).componentsJoinedByString("").componentsSeparatedByString(" ")

            for ingredient in ingredientData {
                for word in trimmedWordsArray {
                    if word == ingredient {
                        
                    }
                }
            }
        }
    }
    
    func sortMeals() { //currently unnecessary
        //eliminate any foods based on dietary restrictions
        //sort based on number of tags that it hits.
        //if there are less than five returned, then you might want to handle that. maybe pick something from the saved options. but that's for a later date.
    }
    
    func binarySearch(words:[String], target: String){
        // Initialize clamps
        var left = words.startIndex
        var right = words.endIndex
        var midpoint = words.count / 2
        var iterations = 0
        
        for index in left...right {
            iterations += 1
            if midpoint < target {
                println("Low: \(midpoint) < \(target)")
                left = midpoint
                midpoint = (right + left) / 2
            } else if midpoint > target {
                println("High: \(midpoint) > \(target)")
                right = midpoint
                midpoint = (right + left) / 2
            } else {
                print("Target, \(target) acquired after \(iterations) iterations")
                break
            }
        }
    }
    
    func wordCount(toSearch: String, target: String) -> [String: Int] {
        var words = toSearch.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        var wordDictionary = [String: Int]()
        for word in words {
            if let count = wordDictionary[word] {
                wordDictionary[word] = count + 1
            } else {
                wordDictionary[word] = 1
            }
        }
        return wordDictionary
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
