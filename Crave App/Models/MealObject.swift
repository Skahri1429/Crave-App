//
//  MealObject.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/28/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import RealmSwift

class MealObject: Object {
    
    dynamic var mealTitle = ""
    dynamic var mealDescription = ""
    dynamic var nameOfVenue = ""
    dynamic var priceValue: Double = 0
    dynamic var score: Double = 0
//    dynamic var longitudeOfVenue = ""
//    dynamic var latitudeOfVenue = ""
//    dynamic var distanceToVenue = 0
//    dynamic var addressofVenue = ""
//    dynamic var saved = false

    
    dynamic var relevantMatchedIngredients = [] // use .count function for sort priority in sortMeals()
    dynamic var allMatchedIngredients = [] //same as above


    //TO BE PASSED IN TO FILL OUT TABLE VIEW CELL WITH INFORMATION
    
   // meal image (perform google search)? 
    // title of meal
    // description of meal
    // location of meal restaurant
    // distance to restaurant
    // bookmarked (true/false)
    // address of venue
    // hours of venue
    
}
 