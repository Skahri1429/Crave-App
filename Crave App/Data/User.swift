//
//  User.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/30/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import RealmSwift

class User: Object {
    let recommendedMeals: [MealObject] = []
    
    let savedMeals: [MealObject] = []

    let relevantCategories: [String] = ["4d4b7105d754a06374d81259"]
    let ingredientsLiked: [String] = []

        
    //create enum
    //case selected
        //populate with relevant ingredients
}
