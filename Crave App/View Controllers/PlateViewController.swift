//
//  PlateViewController.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/15/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit

class PlateViewController: UITableViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    let locationHelper = LocationHelper.sharedInstance
    let userChoice = UserChoiceCollectionDataSource()
    var mealArray: [MealObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationHelper.setupLocation()
        
       //THIS CLOSURE IS NOT WORKING. NOT CALLING THE METHOD.
        //locationHelper.callback = {
            
        mealArray = userChoice.getUserSuggestions()
        
        //}
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.estimatedRowHeight = 125
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.titleLabel.text = "Your Plate"
        self.subtitleLabel.text = "The top 5 suggestions based on the information you provided"
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    
// TODO: func suggestionsRecieved(food : [MealObject])
    // do whatever UI business
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlateViewController: UITableViewDataSource {
    //https://realm.io/news/building-tableviews-swift-ios8/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath) as! PlateTableViewCell
        let meals = mealArray[indexPath.row]
        cell.mealTitleLabel.text = meals.mealTitle
        cell.descriptionLabel.text = meals.mealDescription
        cell.priceLabel.text = "\(meals.priceValue)"
       // cell.restaurantLabelHolder = "The label functionality is working"
        
        let row = indexPath.row
        
        /* how to add images to a cell, for later on:
        cell.imageView?.image = UIImage(named: "YOUR_FILENAME_HERE")
        */
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

extension PlateViewController: UITableViewDelegate {
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //timelineComponent.targetWillDisplayEntry(indexPath.row)
    }
    
}
