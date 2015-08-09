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
                categoriesSelected.append("4bf58dd8d48988d1c8941735,4bf58dd8d48988d10a941735")
                case "American":
                    categoriesSelected.append("4bf58dd8d48988d14e941735,4bf58dd8d48988d157941735,4bf58dd8d48988d1df931735,4bf58dd8d48988d16c941735,4d4ae6fc7a7b7dea34424761,4bf58dd8d48988d14c941735")
                case "Asian":
                categoriesSelected.append("4bf58dd8d48988d142941735,52e81612bcbc57f1066b7a03,4eb1bd1c3b7b55596b4a748f,52e81612bcbc57f1066b79fb,52af0bd33cf9994f4e043bdd,4bf58dd8d48988d111941735,55a59bace4b013909087cb0c,55a59bace4b013909087cb30,55a59bace4b013909087cb21,55a59bace4b013909087cb06,55a59bace4b013909087cb1b,55a59bace4b013909087cb1e,55a59bace4b013909087cb18,55a59bace4b013909087cb24,55a59bace4b013909087cb15,55a59bace4b013909087cb27,55a59bace4b013909087cb12,55a59bace4b013909087cb2d,55a59a31e4b013909087cb00,55a59af1e4b013909087cb03,55a59bace4b013909087cb2a,55a59bace4b013909087cb0f,55a59bace4b013909087cb33,55a59bace4b013909087cb09,55a59bace4b013909087cb36,4bf58dd8d48988d113941735,4bf58dd8d48988d156941735,4eb1d5724b900d56c88a45fe,4bf58dd8d48988d1d1941735,52af39fb3cf9994f4e043be9,4bf58dd8d48988d14a941735")
                case "Caribbean":
                categoriesSelected.append("4bf58dd8d48988d144941735")
                case "Chinese":
                categoriesSelected.append("4bf58dd8d48988d145941735,52af3a5e3cf9994f4e043bea,52af3a723cf9994f4e043bec,52af3a7c3cf9994f4e043bed,52af3a673cf9994f4e043beb,52af3a903cf9994f4e043bee,4bf58dd8d48988d1f5931735,52af3a9f3cf9994f4e043bef,52af3aaa3cf9994f4e043bf0,52af3ab53cf9994f4e043bf1,52af3abe3cf9994f4e043bf2,52af3ac83cf9994f4e043bf3,52af3ad23cf9994f4e043bf4,52af3add3cf9994f4e043bf5,52af3af23cf9994f4e043bf7,52af3ae63cf9994f4e043bf6,52af3afc3cf9994f4e043bf8,52af3b053cf9994f4e043bf9,52af3b213cf9994f4e043bfa,52af3b293cf9994f4e043bfb,52af3b343cf9994f4e043bfc,52af3b3b3cf9994f4e043bfd,52af3b463cf9994f4e043bfe,52af3b633cf9994f4e043c01,52af3b513cf9994f4e043bff,52af3b593cf9994f4e043c00,52af3b6e3cf9994f4e043c02,52af3b773cf9994f4e043c03,52af3b813cf9994f4e043c04,52af3b893cf9994f4e043c05,52af3b913cf9994f4e043c06,52af3b9a3cf9994f4e043c07,52af3ba23cf9994f4e043c08")
            case "Deli":
                categoriesSelected.append("4bf58dd8d48988d146941735")
            case "EastEuro":
                categoriesSelected.append("52e81612bcbc57f1066b7a01,5293a7d53cf9994f4e043a45,52f2ae52bcbc57f1066b8b81,4bf58dd8d48988d109941735,52e928d0bcbc57f1066b7e97,52960bac3cf9994f4e043ac4,52e928d0bcbc57f1066b7e98,52e81612bcbc57f1066b7a04,5293a7563cf9994f4e043a44,52e928d0bcbc57f1066b7e9d,52e928d0bcbc57f1066b7e9c,52e928d0bcbc57f1066b7e96,52e928d0bcbc57f1066b7e9a,52e928d0bcbc57f1066b7e9b")
            case "Falafel":
                categoriesSelected.append("4bf58dd8d48988d10b941735")
            case "French":
                categoriesSelected.append("4bf58dd8d48988d10c941735")
            case "German":
                categoriesSelected.append("4bf58dd8d48988d10d941735")
            case "Hawaiian":
                categoriesSelected.append("52e81612bcbc57f1066b79fe")
            case "Indian":
                categoriesSelected.append("4bf58dd8d48988d10f941735,54135bf5e4b08f3d2429dfe5,54135bf5e4b08f3d2429dff3,54135bf5e4b08f3d2429dff5,54135bf5e4b08f3d2429dfe2,54135bf5e4b08f3d2429dff2,54135bf5e4b08f3d2429dfe1,54135bf5e4b08f3d2429dfe3,54135bf5e4b08f3d2429dfe8,54135bf5e4b08f3d2429dfe9,54135bf5e4b08f3d2429dfe6,54135bf5e4b08f3d2429dfdf,54135bf5e4b08f3d2429dfe4,54135bf5e4b08f3d2429dfe7,54135bf5e4b08f3d2429dfea,54135bf5e4b08f3d2429dfeb,54135bf5e4b08f3d2429dfed,54135bf5e4b08f3d2429dfee,54135bf5e4b08f3d2429dff4,54135bf5e4b08f3d2429dfe0,54135bf5e4b08f3d2429dfdd,54135bf5e4b08f3d2429dff6,54135bf5e4b08f3d2429dfef,54135bf5e4b08f3d2429dff0,54135bf5e4b08f3d2429dff1,54135bf5e4b08f3d2429dfde,54135bf5e4b08f3d2429dfec")
            case "Indonesian":
                categoriesSelected.append("52960eda3cf9994f4e043ac9,52960eda3cf9994f4e043acb,52960eda3cf9994f4e043aca,52960eda3cf9994f4e043acc,52960eda3cf9994f4e043ac7,52960eda3cf9994f4e043ac8,52960eda3cf9994f4e043ac5,52960eda3cf9994f4e043ac6")
            case "Italian":
                categoriesSelected.append("4bf58dd8d48988d110941735,55a5a1ebe4b013909087cbb6,55a5a1ebe4b013909087cb7c,55a5a1ebe4b013909087cba7,55a5a1ebe4b013909087cba1,55a5a1ebe4b013909087cba4,55a5a1ebe4b013909087cb95,55a5a1ebe4b013909087cb89,55a5a1ebe4b013909087cb9b,55a5a1ebe4b013909087cb98,55a5a1ebe4b013909087cbbf,55a5a1ebe4b013909087cb79,55a5a1ebe4b013909087cbb0,55a5a1ebe4b013909087cbb3,55a5a1ebe4b013909087cb74,55a5a1ebe4b013909087cbaa,55a5a1ebe4b013909087cb83,55a5a1ebe4b013909087cb77,55a5a1ebe4b013909087cb8c,55a5a1ebe4b013909087cb92,55a5a1ebe4b013909087cb8f,55a5a1ebe4b013909087cb86,55a5a1ebe4b013909087cbb9,55a5a1ebe4b013909087cb7f,55a5a1ebe4b013909087cbbc,55a5a1ebe4b013909087cb9e,55a5a1ebe4b013909087cbc2,55a5a1ebe4b013909087cbad")
            case "Mediterranean":
                categoriesSelected.append("4bf58dd8d48988d1c0941735,4bf58dd8d48988d1c3941735")
            case "Mexican":
                categoriesSelected.append("4bf58dd8d48988d1c1941735,4bf58dd8d48988d153941735,4bf58dd8d48988d151941735")
            case "Persian":
                categoriesSelected.append("52e81612bcbc57f1066b79f7")
            case "Pizza":
                categoriesSelected.append("4bf58dd8d48988d1ca941735")
            case "Seafood":
                categoriesSelected.append("4bf58dd8d48988d1d2941735,4edd64a0c7ddd24ca188df1a")
            case "Steakhouse":
                    categoriesSelected.append("4bf58dd8d48988d1cc941735")
            case "Turkish":
                categoriesSelected.append("4f04af1f2fb6e1c99f3db0bb,530faca9bcbc57f1066bc2f3,530faca9bcbc57f1066bc2f4,5283c7b4e4b094cb91ec88d8,5283c7b4e4b094cb91ec88d9,5283c7b4e4b094cb91ec88d7,5283c7b4e4b094cb91ec88db,5283c7b4e4b094cb91ec88d6,5283c7b4e4b094cb91ec88d5,5283c7b4e4b094cb91ec88da,530faca9bcbc57f1066bc2f2,5283c7b4e4b094cb91ec88d4")
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

//enum Category {
//    case Afghan, African, American, Asian, Caribbean, Chinese, Deli, EastEuro, Falafel, French, German, Greek, Hawaiian, Indian, Indonesian, Italian, Mediterranean, Mexican, Persian, Pizza, Seafood, Steakhouse, Turkish, Thai
//}