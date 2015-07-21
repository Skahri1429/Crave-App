//
//  PlateViewController.swift
//  Crave App
//
//  Created by Pankaj Khillon on 7/15/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit
import CoreLocation

import QuadratTouch

class PlateViewController: UITableViewController, UITableViewDataSource, CLLocationManagerDelegate, SearchTableViewControllerDelegate, SessionAuthorizationDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchController: UISearchController!
    var resultsTableViewController: SearchTableViewController!
    
    var session : Session!
    var locationManager : CLLocationManager!
    var venueItems : [[String: AnyObject]]?
    
    let numberFormatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self


        numberFormatter.numberStyle = .DecimalStyle
        
        session = Session.sharedSession()
        session.logger = ConsoleLogger()
        
        resultsTableViewController = Storyboard.create("venueSearch") as! SearchTableViewController
        resultsTableViewController.session = session
        resultsTableViewController.delegate = self
        searchController = UISearchController(searchResultsController: resultsTableViewController)
        searchController.searchResultsUpdater = resultsTableViewController
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
        
        // Do any additional setup after loading the view.
    }
    
    func searchTableViewController(controller: SearchTableViewController, didSelectVenue venue:JSONParameters) {
        println("now conforms to protocol")
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

extension CLLocation { //necessary for parameters
    func parameters() -> Parameters {
        let ll      = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc   = "\(self.horizontalAccuracy)"
        let alt     = "\(self.altitude)"
        let altAcc  = "\(self.verticalAccuracy)"
        let parameters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}


class Storyboard: UIStoryboard { //necessary for Storyboard creation
    class func create(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(name) as! UIViewController
    }
}
