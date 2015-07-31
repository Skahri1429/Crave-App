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
   let meals = List<MealObject>()
}
