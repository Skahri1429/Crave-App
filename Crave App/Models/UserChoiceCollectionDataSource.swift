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

class UserChoiceCollectionDataSource {
    
    let tagData = TagData()
    var categoryTagSearch: [String] = []
   
    let mealObject = MealObject()
    var foundMeals: [MealObject] = []
    
    let currentUser = User()
    let ingredientData: [String]!
    
    lazy var numElements: Int = {
        
    return self.categoryTagSearch.count
}()
    var counter = 1
    
    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU"
    
    let locationManager = LocationHelper()
    
    var venueNamesDictionary: [String: (Int, String)] = [:] //name : (distance from user, venueID)
    var finishedVenueNamesDictiontary: [String: String] = [:] //name: venueID
    
    var venueInformation: [(String, Int, String)]!
    var finishedVenueIdArray: [String] = []
    
    init() {
        self.categoryTagSearch = tagData.relevantUserTags
        self.ingredientData  = currentUser.ingredientsLiked
        
    }
   
    func getUserSuggestions() -> [MealObject] {
        
        // TODO: instead of returning [MealObject] take a closure as argument
        
        
        
        let longitude = locationManager.locValue?.longitude
        let latitude = locationManager.locValue?.latitude
        if counter == numElements {
            
           let tempSortedVenues = sortVenues(venueInformation)
           finishedVenueIdArray = filterVenues(tempSortedVenues)
           foundMeals = findMeals(finishedVenueIdArray)
        }
        
        else {
            let tempArray = ["4bf58dd8d48988d1c5941735"]
           for tag in tempArray {
            
            let urlString = "https://api.foursquare.com/v2/venues/search?ll=\(longitude),\(latitude)&categoryId=\(tag)&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
            
            println(urlString)
            
            if let url = NSURL(string: urlString) {
                if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) {
                    let json = JSON(data: data)
                    print(json["response"]["venues"])
                    if json["meta"]["code"].intValue == 200 {
                        // we're OK to parse!
                        
                        let venues = json["response"]["venues"].arrayValue
                        
                        for venue in venues {
                            let venueDict = venue.dictionary
                           let name = venueDict!["name"]!.stringValue
                            let id = venueDict!["id"]!.stringValue
                            let location = venueDict!["location"]!.dictionary
                            let distance = location!["distance"]!.intValue
                            
                            println(name + " distance: \(distance)")
                            let tempTuple = (name, distance, id)
                            venueInformation.append(tempTuple)
                        }
//                            venueNamesDictionary[result["venue"]["name"].stringValue] =
//                            (result["venues"]["location"]["distance"].int!, result["venue"]["id"].stringValue)
                            
                            // dictName[key] = value
                            
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
                    
                }
                    
            }
            else {
                println("Error in retrieving JSON")
            }
            }
        }
    return foundMeals
    }
    
    func sortVenues(unfilteredVenueInfo: [(String, Int, String)]) -> [(String, Int, String)] {
        //sort by distance
        
        var venueInfo: [(String, Int, String)] = unfilteredVenueInfo
        for venue in venueInfo {
            println(venue)
        }
        func sorter(t1: (String, Int, String), t2: (String, Int, String)) -> Bool {
            return t1.1 < t2.1
        }
        
        var sortedVenueInfo = venueInfo.sorted({sorter($0, $1)})
        
        return sortedVenueInfo
        
    }

    func filterVenues(sortedVenueInfo: [(String, Int, String)]) -> [String] { //returns array of closest 15VenueIDs
        var idArray: [String] = []
        var filteredArray: [String] = []
        for venueElement in sortedVenueInfo {
            idArray.append(venueElement.2)
        }
        for index in 0...15 {
            filteredArray.insert(idArray[index], atIndex: index)
        }
        return filteredArray
    }

    func findMeals(venueIDArray: [String]) -> [MealObject] { //REUSABLE IN CHOOSEVIEWCONTROLLER
        let venuesToSearch = venueIDArray
        var sortedMealObjects: [MealObject] = []

        for venue in venuesToSearch {
            
            let urlString = "https://api.foursquare.com/v2/venues/\(venue)/menu&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
            
            if let url = NSURL(string: urlString) { // if #1
                if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) { //if #2
                    let json = JSON(data: data)
                    if json["meta"]["code"].intValue == 200 { //if #3
                        if json["response"]["menu"]["menus"]["count"].int == 1 { //if #4
                            
                            for subcategories in json["response"]["menu"]["menus"]["items"]["entries"]["items"].arrayValue {
                                
                                for dishes in json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"].arrayValue {
                                
                                    mealObject.mealTitle = json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"]["name"].stringValue
                                    mealObject.mealDescription = json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"]["description"].stringValue
                                    mealObject.priceValue = json["response"]["menu"]["menus"]["items"]["entries"]["items"]["entries"]["items"]["price"].doubleValue
                                    let urlString: String = json["response"]["menu"]["provider"]["attributionLink"].stringValue
                                    let urlArray: [String] = urlString.componentsSeparatedByString("/")
                                    mealObject.nameOfVenue = urlArray[3].capitalizedString
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
        }
        return sortedMealObjects
    } // end function

    func searchMealDescriptions(meals: [MealObject]) {
        
        let mealObjectArray = meals
        for mealItem in mealObjectArray {
            
            let mealDescription = mealItem.mealDescription // [String] of meal descriptions
            let characterSet: NSCharacterSet = NSCharacterSet.punctuationCharacterSet()
            let mealDescriptionWordsArray: [String] = (mealDescription.componentsSeparatedByCharactersInSet(characterSet) as NSArray).componentsJoinedByString("").componentsSeparatedByString(" ")
            let userBankArray = tagData.ingredientArray
            
            mealItem.score = calcScore(mealDescriptionWordsArray, userArray: userBankArray)
        }
    }
    
    func calcScore(wordArray: [String], userArray: [String]) -> Double {
        //let totalBank = bankArray
        let userBank = userArray
        var userFound: Double = 0
        let descriptionArray = wordArray
        for word in descriptionArray {
            for comparison in userBank {
                if word == comparison {
                    userFound++
                }
            }
        }
        let score = userFound / Double(userBank.count)
        return score
    }
    
    func sortMeals(meals: [MealObject]) -> [MealObject] { //sort by score
        var mealObjectArray = meals
        mealObjectArray.sort({ $0.score > $1.score })
        return mealObjectArray
    }
}