//
//  ChooseHelper.swift
//  Crave App
//
//  Created by Pankaj Khillon on 8/4/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class ChooseHelper {

    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU"
    
    let realm = Realm()
    let mealObject = MealObject()
    var foundMeals: [MealObject] = []
    var sortedMealObjects: [MealObject] = []
    
    let currentUser = User()
    var ingredientData: [String] = currentUser.ingredientsLiked
    var categoryTagSearch = currentUser.relevantCategories
    
    let userChoice = UserChoiceCollectionDataSource()
    
    var longitude = userChoice.longitude
    var latitude = userChoice.latitude
 
    func locateVenue(query: String) -> [MealObject] {
        
        let searchQuery = query
        let urlString = "https://api.foursquare.com/v2/venues/suggestCompletion?ll=\(longitude),\(latitude)&query=\(searchQuery)&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
        
        println(urlString)
        if let url = NSURL(string: urlString) { // if #1
            if let data = NSData(contentsOfURL: url, options: .allZeros, error: nil) { //if #2
                let json = JSON(data: data)
                if json["meta"]["code"].intValue == 200 { //if #3
                    
                    for venue in json["response"]["minivenues"].arrayValue {
                         mealObject.venueId = venue["id"].stringValue
                         mealObject.nameOfVenue = venue["name"].stringValue
                         mealObject.distanceToVenue = venue["location"]["distance"].intValue
                         mealObject.addressofVenue = venue["location"]["address"].stringValue
                         foundMeals.append(mealObject)
                    }
 
                } else {
                    println("Error in retrieving JSON")
                } // end else
                
            }
        } //end if #1
        
        searchMealDescriptions(foundMeals)
        sortedMealObjects = sortMeals(foundMeals)
        return sortedMealObjects
    } //end function
    
    func searchMealDescriptions(meals: [MealObject]) {
        
        let mealObjectArray = meals
        for mealItem in mealObjectArray {
            
            let mealDescription = mealItem.mealDescription // [String] of meal descriptions
            let characterSet: NSCharacterSet = NSCharacterSet.punctuationCharacterSet()
            let mealDescriptionWordsArray: [String] = (mealDescription.componentsSeparatedByCharactersInSet(characterSet) as NSArray).componentsJoinedByString("").componentsSeparatedByString(" ")
            let userBankArray = ingredientData
            
            mealItem.score = calcScore(mealDescriptionWordsArray, userArray: userBankArray)
        }
    }
    
    func calcScore(wordArray: [String], userArray: [String]) -> Double {
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
