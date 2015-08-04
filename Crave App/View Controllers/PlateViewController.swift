//
//  PlateViewController.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/15/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit


import QuadratTouch

class PlateViewController: UITableViewController, UITableViewDataSource, SessionAuthorizationDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    let locationManager = LocationHelper()
    let userChoice = UserChoiceCollectionDataSource()
    var searchController: UISearchController!
    
    var session : Session!

    var venueItems : [[String: AnyObject]]?
    
    let numberFormatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        locationManager.setupLocation()
        
        
        // ACCESS USERCHOICECOLLECTIONDATASOURCE HERE 
        UserChoiceCollectionDataSource().findVenues()

        numberFormatter.numberStyle = .DecimalStyle
        
        // Do any additional setup after loading the view.
    }
    
    


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
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath) as! PlateTableViewCell
        
        cell.restaurantLabelHolder = "The label functionality is working"
        
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
