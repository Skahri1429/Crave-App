//
//  ChooseHelper.swift
//  Crave App
//
//  Created by Pankaj Khillon on 8/4/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import CoreLocation
import QuadratTouch
import Foundation
import Alamofire
import SwiftyJSON

class ChooseHelper {

    let CLIENT_ID = "GBFQRRGTBCGRIYX5H204VMOD1XRQRYDVZW1UCFNFYQVLKZLY"
    let CLIENT_SECRET = "KZRGDLJNGKDNVWSK2YID2WBAKRH2KBQ2ROIXPFW5FOFSNACU"
    
    let mealObject = MealObject()
    var foundMeals: [MealObject] = []
    var sortedMealObjects: [MealObject] = []
    let tagData = TagData()
    var categoryTagSearch: [String] = []
    
    let currentUser = User()
    let ingredientData: [String]!
    
    init() {
        self.categoryTagSearch = tagData.relevantUserTags
        self.ingredientData  = currentUser.ingredientsLiked
        
    }
    
    func findMeals(venueID: String) -> [MealObject] {
        
        let urlString = "https://api.foursquare.com/v2/venues/\(venueID)/menu&client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&v=20150729"
        
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
        return sortedMealObjects
    } //end function
    
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
