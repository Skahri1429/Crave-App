//
//  User.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/30/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import RealmSwift

class User {
    //let recommendedMeals: [MealObject] = []
    var savedMeals: [MealObject] = []
    var ingredientsLiked: [String] = []
    var relevantCategories: [Category] = []
    
    init() {
    self.relevantCategories = CategoriesCollectionViewController().categoriesSelected
    }
    
    for relevant in relevantCategories {
    switch relevant {
    case Category.Afghan:
        let afghanArray: String = []
        for ingredient in afghanArray {
            ingredientsLiked.append(ingredient)
        }
    case Category.African:
    case Category.American:
    case Category.Asian:
    case Category.Caribbean:
    case Category.Chinese:
    case Category.Deli:
    case Category.EastEuro:
    case Category.Falafel:
    case Category.French:
    case Category.German:
    case Category.Greek:
    case Category.Hawaiian:
    case Category.Indian:
    case Category.Indonesian:
    case Category.Italian:
    case Category.Mediterranean:
    case Category.Mexican:
    case Category.Persian:
    case Category.Pizza:
    case Category.Seafood:
    case Category.Steakhouse:
    case Category.Turkish:
    case Category.Thai:
    }
    }

    
    //let likedFoodTypes: [FoodCategory] = []
    
    //somewhere for every swipe right you will have to append to likedFoodTypes array
    
    /*
    for category in likedFoodTypes {
        ingredients
    }

        
    //create enum
    //case selected
        //populate with relevant ingredients
}*/
}