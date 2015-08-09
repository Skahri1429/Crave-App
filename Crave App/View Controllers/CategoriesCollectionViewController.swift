//
//  CategoriesCollectionViewController.swift
//  Crave App
//
//  Created by Pankaj Khillon on 8/7/15.
//  Copyright (c) 2015 Sarthak Khillon. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class CategoriesCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var categoryLabel: UILabel!
    
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    var categoriesSelected: [String] = []
    var ingredientsToAppend: [String] = []
    let categoryBank = ["Afghan", "African", "American", "Asian", "Caribbean", "Chinese", "Deli", "EastEuro", "French", "German", "Hawaiian", "Indian", "Indonesian", "Italian", "Mediterranean", "Mexican", "Persian", "Pizza", "Seafood", "Thai"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        self.collectionView!.allowsMultipleSelection = true
        self.collectionView!.selectItemAtIndexPath(nil, animated: true, scrollPosition: .None)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        //don't think you need this, since you're going through multiple functions
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return categoryBank.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! CategoryCollectionViewCell
        
        cell.tintColor = UIColor.greenColor()
        
        // Configure the cell
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: 120, height: 120)
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    override func collectionView(collectionView: UICollectionView,
        didSelectItemAtIndexPath indexPath: NSIndexPath) {
            let cell = collectionView.cellForItemAtIndexPath(indexPath)
            
            let category = self.categoryBank[indexPath.row]
            
            switch(category) {
                case "Afghan":
                categoriesSelected.append("503288ae91d4c4b30a586d67")
                
                case "African":
                    let catHolder = "4bf58dd8d48988d1c8941735"
                    let catArray = catHolder.componentsSeparatedByString(",")
                    for cat in catArray {
                        categoriesSelected.append(cat)
                }
                
                case "American":
                    let catHolder = "4bf58dd8d48988d14e941735"
                    let catArray = catHolder.componentsSeparatedByString(",")
                    for cat in catArray {
                        categoriesSelected.append(cat)
                    }
                
                case "Asian":
                let catHolder = "4bf58dd8d48988d142941735"
                let catArray = catHolder.componentsSeparatedByString(",")
                for cat in catArray {
                categoriesSelected.append(cat)
                }
                
                case "Caribbean":
                categoriesSelected.append("4bf58dd8d48988d144941735")
                case "Chinese":
                    let catHolder = "4bf58dd8d48988d145941735"
                    let catArray = catHolder.componentsSeparatedByString(",")
                    for cat in catArray {
                        categoriesSelected.append(cat)
                    }
                
            case "Deli":
                categoriesSelected.append("4bf58dd8d48988d146941735")
            case "EastEuro":
                let catHolder = "52e81612bcbc57f1066b7a01,5293a7d53cf9994f4e043a45,52f2ae52bcbc57f1066b8b81,4bf58dd8d48988d109941735,52e928d0bcbc57f1066b7e97,52960bac3cf9994f4e043ac4,52e928d0bcbc57f1066b7e98,52e81612bcbc57f1066b7a04,5293a7563cf9994f4e043a44,52e928d0bcbc57f1066b7e9d,52e928d0bcbc57f1066b7e9c,52e928d0bcbc57f1066b7e96,52e928d0bcbc57f1066b7e9a,52e928d0bcbc57f1066b7e9b"
                let catArray = catHolder.componentsSeparatedByString(",")
                for cat in catArray {
                categoriesSelected.append(cat)
                }
            case "Falafel":
                categoriesSelected.append("4bf58dd8d48988d10b941735")
            case "French":
                categoriesSelected.append("4bf58dd8d48988d10c941735")
            case "German":
                categoriesSelected.append("4bf58dd8d48988d10d941735")
            case "Hawaiian":
                categoriesSelected.append("52e81612bcbc57f1066b79fe")
            case "Indian":
                categoriesSelected.append("4bf58dd8d48988d10f941735")
            case "Indonesian":
                categoriesSelected.append("52960eda3cf9994f4e043ac9")
            case "Italian":
                categoriesSelected.append("4bf58dd8d48988d110941735")
            case "Mediterranean":
                categoriesSelected.append("4bf58dd8d48988d1c0941735,4bf58dd8d48988d1c3941735")
            case "Mexican":
                categoriesSelected.append("4bf58dd8d48988d1c1941735")
            case "Persian":
                categoriesSelected.append("52e81612bcbc57f1066b79f7")
            case "Pizza":
                categoriesSelected.append("4bf58dd8d48988d1ca941735")
            case "Seafood":
                categoriesSelected.append("4bf58dd8d48988d1d2941735,4edd64a0c7ddd24ca188df1a")
            case "Steakhouse":
                    categoriesSelected.append("4bf58dd8d48988d1cc941735")
            case "Turkish":
                categoriesSelected.append("4f04af1f2fb6e1c99f3db0bb")
            case "Thai":
            categoriesSelected.append("4bf58dd8d48988d149941735")
            default:
                println("No categories appended")
            }
    }

    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        categoriesSelected.removeAtIndex(indexPath.row)
    }

}