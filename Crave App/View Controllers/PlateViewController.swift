//
//  PlateViewController.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/15/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit

class PlateViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    let locationHelper = LocationHelper.sharedInstance
    let userChoice = UserChoiceCollectionDataSource()
    var mealArray: [MealObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationHelper.setupLocation()
        
        locationHelper.callback = {
            
        self.mealArray = self.userChoice.getUserSuggestions()
            
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 125
        tableView.rowHeight = UITableViewAutomaticDimension

        titleLabel.text = "Your Plate"
        subtitleLabel.text = "The top 5 suggestions based on the information you provided"

    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "plateSegue" {
            if let destinationVC = segue.destinationViewController as? ResultsViewController {
                
            }
        }
    }

  //https://realm.io/news/building-tableviews-swift-ios8/
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath) as! PlateTableViewCell
        
        
//        let meals = mealArray[indexPath.row]
//        /* FATAL ERROR: ARRAY INDEX OUT OF RANGE
//        INDEXPATH.ROW = 0
//        */
//        
//        print(indexPath.row)
//        cell.mealTitleLabel.text = meals.mealTitle
//        cell.descriptionLabel.text = meals.mealDescription
//        cell.priceLabel.text = "\(meals.priceValue)"
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        print("stuff")
        //timelineComponent.targetWillDisplayEntry(indexPath.row)
    }
    
}
