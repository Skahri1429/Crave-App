//
//  TagData.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/21/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//


class TagData {
    // will create a list of relevant search terms to the user. 
    // set below to new values whenever the user eats.
    var mutableRelatedTags = []
    
    init() {
        mutableRelatedTags =  ["tempMeal1", "tempMeal2"]
    }
}