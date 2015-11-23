//
//  TableViewController.swift
//  FoodPin
//
//  Created by KaL on 11/3/15.
//  Copyright © 2015 KaL. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var restaurantNames: [String] = []
    var restaurantImages: [String] = []
    var restaurantLocations: [String] = []
    var restaurantTypes: [String] = []
    var restaurantIsVisited = [Bool](count:21, repeatedValue:false)
    
//    var detailVC = DetailViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh’s Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina",
            "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
        
        restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg",
            "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg",
            "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg",
            "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg",
            "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
        
        restaurantLocations = ["Hong Kong", "HongKong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
        
        restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish","Spanish", "British", "Thai"]
        
        self.tableView.reloadData()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
//    override func prefersStatusBarHidden() -> Bool {
//        return true
//    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.TypeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbNailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.thumbNailImageView.layer.cornerRadius = cell.thumbNailImageView.frame.size.width/2
        cell.thumbNailImageView.clipsToBounds = true
        
        if restaurantIsVisited[indexPath.row]{
            cell.accessoryType = .Checkmark

        } else {
            cell.accessoryType = .None

        }

        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showRestaurantDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurantImage = restaurantImages[indexPath.row]
                destinationController.nameText = restaurantNames[indexPath.row]
                destinationController.locationText = restaurantLocations[indexPath.row]
                destinationController.typeText = restaurantTypes[indexPath.row]

            }
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let shareRowAction = UITableViewRowAction(style: .Default, title: "Share") { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            let shareAlert = UIAlertController(title: nil, message: "Share using", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: .Default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: .Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)

            shareAlert.addAction(twitterAction)
            shareAlert.addAction(facebookAction)
            shareAlert.addAction(emailAction)
            shareAlert.addAction(cancelAction)
            
            self.presentViewController(shareAlert, animated: true, completion: nil)
        }
        
        let deleteRowAction = UITableViewRowAction(style:.Default, title: "Delete") { (action:UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
        
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            print("total items = \(self.restaurantNames.count)")
            for name in self.restaurantNames{
            print(name)
            }
        }
        
        shareRowAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        
        return [deleteRowAction,shareRowAction]
    }
    
    
//    -      shareRowAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        let callHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//       
//        let isVisitAction = UIAlertAction(title: "I've been here", style: .Default) {(UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            
//            if cell?.accessoryType == UITableViewCellAccessoryType.None{
//                cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
//                self.restaurantIsVisited[indexPath.row] = true
//            } else {
//                cell?.accessoryType = UITableViewCellAccessoryType.None
//                self.restaurantIsVisited[indexPath.row] = false
//            }
//            
//            
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callHandler)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(isVisitAction)
//
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            restaurantNames.removeAtIndex(indexPath.row)
//            restaurantLocations.removeAtIndex(indexPath.row)
//            restaurantTypes.removeAtIndex(indexPath.row)
//            restaurantIsVisited.removeAtIndex(indexPath.row)
//            restaurantImages.removeAtIndex(indexPath.row)
//            
//            print("total items = \(restaurantNames.count)")
//            for name in restaurantNames{
//                print(name)
//            }
//            
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
    
   
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
